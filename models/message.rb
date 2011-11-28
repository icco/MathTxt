class Message < CouchRest::Model::Base
  property :text, String
  property :from, String
  timestamps!

  design do
    view :by_from
  end

  def to_json
    return JSON.generate self
  end

  def parsed
    return ParsedMessage.by_message({:message => self}).first
  end

  def parsed?
    return !self.parsed.nil?
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

  def self.get_all_from number
    query = self.by_from({:from => number})

    return query.all
  end
end
