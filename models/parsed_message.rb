class ParsedMessage < CouchRest::Model::Base
  property :message, Message
  property :action, Action
  property :amount, Number
  property :list, MessageList
  timestamps!

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
      pm.list = MessageList.find(msg.from, result[3].strip)
      pm.save
    end

    return true
  end
end
