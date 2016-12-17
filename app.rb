require("sinatra")
require("sinatra/reloader")
require('sinatra/activerecord')
also_reload("lib/**/*.rb")
require("pg")
require('./lib/brand')
require('./lib/store')

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
  Store.create({name: name})
  erb(:stores)
end

post('/brands') do
  name = params.fetch('new-brand')
  brand = Brand.new(:name => name, :id => nil)
  brand.save()
  @brands = Brand.all()
  erb(:brands)
end

get('/stores/:id') do
  @store = Store.find(params.fetch('id').to_i())
  @brands = @store.brands()
  erb(:store)
end

get('/brands/:id') do
  @brand = Brand.find(params.fetch('id').to_i())
  @stores = @brand.stores()
  erb(:brand)
end

patch('/stores/:id/edit') do
  name = params.fetch('edit-store')
  @store = Store.find(params.fetch('id').to_i())
  @store.update(:name => name)
  @brands = @store.brands()
  erb(:store)
end

delete('/store/:id/delete') do
  @store = Store.find(params.fetch('id').to_i())
  @store.delete()
  @stores = Store.all()
  erb(:stores)
end

post('/store/:id') do
  name = params.fetch('name')
  store_id = params.fetch('store_id').to_i()
  @store = Store.find(store_id.to_i())
  @brands = Brand.new({:id => nil, :name => name, :store_id => store_id})
  @brands.save()
  @brands = @store.brands()
  erb(:store)
end


patch('/brands/:id') do
  brand_id = params.fetch('id').to_i()
  @brand = Brand.find(brand_id)
  store_ids = params.fetch('store_ids')
  @brand.update({:store_ids => store_ids})
  @stores = Store.all()
  erb(:brand)
end

patch('/stores/:id') do
  store_id = params.fetch('id').to_i()
  @store = Store.find(store_id)
  @brand_ids = params.fetch('brand_ids')
  @brands = Brand.new({:store_ids => [store1.id()]})
  @brands = Brand.all()
  erb(:brand)
end
