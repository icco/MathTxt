
# Production
if ENV['CLOUDANT_URL'] && uri = URI.parse(ENV['CLOUDANT_URL'])
  CouchRest::Model::Base.configure do |config|
    config.connection = {
      :protocol => uri.scheme,
      :host     => uri.host,
      :port     => uri.port,
      :prefix   => 'mathtxt', # database name or prefix
      :suffix   => nil,
      :join     => '_',
      :username => uri.user,
      :password => uri.password
    }
  end
else
  CouchRest::Model::Base.configure do |config|
    config.connection = {
      :protocol => 'https',
      :host     => 'sample.cloudant.com',
      :port     => 443,
      :prefix   => 'mathtxttest', # database name or prefix
      :suffix   => nil,
      :join     => '_',
      :username => 'test',
      :password => 'user'
    }
  end
end
