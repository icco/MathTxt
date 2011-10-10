class MessageList < CouchRest::Model::Base
  property :total, Number
  collection_of :parsed_messages
  property :name, String
  property :creator, String

  design do
    view :by_name_and_creator
  end

  def MessageList.find phone, name
    list = MessageList.by_name_and_creator(name, phone).doc
    p list

    return list
  end
end
