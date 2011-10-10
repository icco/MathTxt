class MessageList < CouchRest::Model::Base
  property :total, Number
  collection_of :parsed_messages
end
