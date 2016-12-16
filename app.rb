require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/brand')
require('./lib/store')

get('/') do
  erb(:index)
end
