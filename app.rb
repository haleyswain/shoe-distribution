require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/brand')
require('./lib/store')
require('pry')

# get '/things' do                      gets an array of things
# get '/things/:id' do                  gets one thing by id
# post '/things' do                     creates a new thing
# patch '/things/:id' do                updates thing with given id
# delete '/things/:id' do               deletes thing with given id

# post '/things/:id/items'              creates an item and adds it to the thing with id
# patch '/things/:thing_id/items/:id'   adds an existing item to the thing

#
get('/') do
  @brands = Brand.all()
  @stores = Store.all()
  erb(:index)
end

get('/stores') do
  @stores = Store.all()
  erb(:stores)
end

get('/brands') do
  @brands = Brand.all()
  erb(:brands)
end

post('/stores') do
  @stores = Store.all()
  name = params.fetch('name')
  store = Store.create({name: name})
  if store.save
    erb(:stores)
  else
    erb(:errors)
  end
end

post('/brands') do
  @brands = Brand.all()
  name = params.fetch('new_brand')
  @brand = Brand.new(:name => name, :id => nil)
  if @brand.save
    redirect ('/')
  else
    erb(:errors)
  end
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i)
  erb(:store)
end


get('/store/:id') do
  @brands = Brand.all()
  @store = Store.find(params.fetch('id').to_i)
  erb(:store)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @stores = Store.all()
  erb(:brand)
end

patch('/stores/:id') do
  name = params.fetch('edit-store')
  store = Store.find(params.fetch('id').to_i())
  store.update(:name => name)
  redirect '/'
end

delete('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  redirect '/'
end

post('/stores/:id') do
  name = params.fetch('name')
  @brands = Brand.all()
  @store = Store.find(params.fetch(store_id.to_i()))
  new_brand = Brand.where({name: name})
  if new_brand.save
    redirect '/'
  else
    erb(:errors)
  end
end

post('/brands/:id') do
  brand_id = params.fetch('id').to_i()
  brand = Brand.find(brand_id)
  store_ids = params.fetch('brand_ids')
  store_ids.each do |store_id|
    store = Store.find(store_id)
    brand.stores.push(store)
    brand.save
  end
  redirect '/'
end

patch('/stores/:id') do
  brands = Brand.all()
  brand_id = Brand.find(params.fetch('brand_id').to_i())
  store = Store.find(params.fetch('id').to_i())
  store.brands.push(@brand_id)
  redirect '/'
end

post('/stores/:id/brands') do
  store = Store.find(params.fetch("id").to_i)
  brand = Brand.create({:name => params.fetch("name")})
  if brand.save
     store.brands.push(brand)
     redirect ('/')
  else
    erb(:errors)
  end
end
