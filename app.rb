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

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

post('/stores') do
  name = params.fetch('new-store')
  store = Store.new(:name => name, :id => nil)
  store.save()
  @stores = Store.all()
  erb(:stores)
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = @store.brands()
  erb(:store)
end
