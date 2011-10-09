class Message < CouchRest::Model::Base
   property :text, String
   property :from, String
   timestamps!
end
