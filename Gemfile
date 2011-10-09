source :rubygems

# Project requirements
gem 'rack', :git => 'git://github.com/rack/rack.git'
gem 'rake'
gem "oauth2", :git => "git://github.com/intridea/oauth2.git"

# Component requirements
gem 'erubis', "~> 2.7.0"
gem 'activerecord', :require => "active_record"

# Database
group :production do
  #gem 'pg'
end

group :development, :test do
  gem 'sqlite3'
  gem 'thin'
end

# Test requirements

# Padrino Stable Gem
gem 'padrino', '0.10.2'
