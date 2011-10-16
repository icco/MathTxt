class Message < CouchRest::Model::Base
  property :text, String
  property :from, String
  timestamps!

  def to_json
    return JSON.generate self
  end

  ## The first method we call when we get a txt
  def Message.inc txt, from
    msg = Message.new
    msg.text = txt
    msg.from = from
    msg.save

    parsed = ParsedMessage.parse msg

    if !parsed
      logger.warn "Unparsable: #{msg.text}"
    else
      list = List.find(parsed.list, from)
      list.parsed_messages << parsed
      list.recount
      list.save
    end

    return parsed
  end
end
