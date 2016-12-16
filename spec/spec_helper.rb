ENV['RACK_ENV'] = 'test'
require("rspec")
require("pg")
require("sinatra/activerecord")
require("brand")
require("store")
require("bundler/setup")

Bundler.require(:default, :test)
set(:root, Dir.pwd())

require('capybara/rspec')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)
require('./app')

Dir[File.dirname(__FILE__) + '/../lib/*.rb'].each { |file| require file }

get("/") do
  erb(:index)
end

# RSpec.configure do |config|
#   config.after(:each) do
#     # Project.all.each(&:destroy)
#   end
# end
