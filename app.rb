require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/client')
require('./lib/stylist')
require('pg')

DBP = PG.connect(dbname: 'hair_salon')

get('/') do
  @stylists = Stylist.all
  erb(:index)
end

post('/stylists') do
  name = params.fetch('name')
  stylist = Stylist.new(name: name, id: nil)
  stylist.save
  @stylists = Stylist.all
  erb(:index)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist)
end

get('/stylists/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist_edit)
end

post('/clients') do
  description = params.fetch('description')
  stylist_id = params.fetch('stylist_id').to_i
  client = Client.new(description: description, stylist_id: stylist_id)
  client.save
  @stylist = Stylist.find(stylist_id)
  erb(:stylist)
end

get('/stylist/:id/edit') do
  @stylist = Stylist.find(params.fetch('id').to_i)
  erb(:stylist_edit)
end

patch('/stylists/:id') do
  name = params.fetch('name')
  @stylist = Stylist.find(params.fetch('id').to_i)
  @stylist.update(name: name)
  erb(:stylist)
end