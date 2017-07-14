class Client
  attr_reader(:name, :clients_id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @clients_id = attributes.fetch(:clients_id).to_i()
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec('SELECT * FROM clients;')
    clients = []
    returned_clients.each do |client|
      name = client.fetch('name')
      clients_id = client.fetch('clients_id').to_i 
      clients.push(Client.new(name: name, clients_id: clients_id))
    end
    clients
  end

  define_method(:save) do
    DB.exec("INSERT INTO clients (name, clients_id) VALUES ('#{@name}', #{@clients_id});")
  end

  define_method(:==) do |another_client|
    name.==(another_client.name).&(clients_id.==(another_client.clients_id))
  end
  end     