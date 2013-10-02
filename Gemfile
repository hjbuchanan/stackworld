source :rubygems

gem 'sinatra', :require => 'sinatra'
gem 'activerecord'
gem 'sinatra-activerecord'
gem 'sinatra-contrib', :require => 'sinatra/reloader'
gem 'rake'

group :development do
  gem 'sqlite3'
  gem 'tux'
end

#can comment these out and then do the bundle install on everything. then it worked--vin's solution
group :production do
  gem 'pg'
end
