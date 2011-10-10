class User < CouchRest::Model::Base
  property :username, String
  property :phone, String
  timestamps!

  def to_json
    return JSON.generate self
  end
end
