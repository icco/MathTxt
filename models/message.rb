class Message < CouchRest::Model::Base
   property :text, String, :read_only => true
   property :from, String
   timestamps!
end
