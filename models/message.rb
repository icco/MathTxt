class Message < CouchRest::Model::Base
  property :text, String
  property :from, String
  timestamps!

  def to_json
    return JSON.generate self
  end

  ## The first method we call when we get a txt
  def Message.inc msg, from
    msg = Message.new
    msg.text = msg
    msg.from = from
    msg.save

    parsed = ParsedMessage.parse msg

    if !parsed
      log.warning "Unparsable: #{msg.txt}"
    end

    return parsed
  end
end
