class ParsedMessage < CouchRest::Model::Base
  property :message, Message
  property :action, Action
  property :amount, Float
  property :list, String
  timestamps!

  def to_json
    return JSON.generate self
  end

  def ParsedMessage.parse msg
    pm = ParsedMessage.new
    pm.message = msg

    verbs = Action.strings.join "|"
    prepositions = [ "to", "from" ].join "|"

    # ^(add|sub) \$?([0-9.]+) ?(to|from)? ?([\w ]+)?$/
    regex = %r{^(#{verbs}) \$?([0-9.]+) ?(#{prepositions})? ?([ \w]+)?$}i
    result = regex.match msg.text

    if result.nil?
      return false
    else
      pm.action = Action.create result[1]
      pm.amount = result[2].to_f
      pm.list = result[4].strip
      pm.save
    end

    return true
  end
end
