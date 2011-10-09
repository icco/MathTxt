class User < CouchRest::Model::Base
  property :username, String
  timestamps!
end
