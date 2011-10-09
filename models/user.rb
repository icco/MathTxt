class User < CouchRest::Model::Base
  property :username, String
  property :phone, String
  timestamps!
end
