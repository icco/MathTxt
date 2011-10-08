source :rubygems

# Project requirements
gem 'rake'
gem 'sinatra-flash'
gem 'gdata'
gem "oauth2", :git => "git://github.com/intridea/oauth2.git"
gem "json"

# Component requirements
gem 'erubis', "~> 2.7.0"
gem 'activerecord', :require => "active_record"

# Database
group :production do
  gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'thin'
end

# Test requirements

# Padrino Stable Gem
gem 'padrino', '0.10.3'
