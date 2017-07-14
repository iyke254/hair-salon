class Client
  attr_reader(:description, :list_id)

  define_method(:initialize) do |attributes|
    @description = attributes.fetch(:description)
    @stylist_id = attributes.fetch(:list_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec('SELECT * FROM clients;')
    clientss = []
    returned_clients.each do |client|
      description = client.fetch('description')
      stylist_id = client.fetch('list_id').to_i 
      clients.push(Client.new(description: description, stylist_id: stylist_id))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (description, stylist_id) VALUES ('#{@description}', #{@stylist_id});")
  end

  define_method(:==) do |another_client|
    description.==(another_client.description).&(stylist_id.==(another_client.stylist_id))
  end
  end