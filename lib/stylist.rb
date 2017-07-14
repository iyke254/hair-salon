class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

# shows all available stylists
  define_singleton_method(:all) do
    returned_stylists = DB.exec('SELECT * FROM stylists;')
    stylists = []
    returned_stylists.each do |stylist|
      name = stylist.fetch('name')
      id = stylist.fetch('id').to_i
      stylists.push(Stylist.new(name: name, id: id))
    end
    stylists
  end
# saves new stylists in the db
  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first.fetch('id').to_i
  end

  define_method(:==) do |another_stylist|
    name.==(another_stylist.name).&(id.==(another_stylist.id))
  end

  define_singleton_method(:find) do |id|
    found_stylist = nil
    Stylist.all.each do |stylist|
      if stylist.id.==(id)
        found_stylist = stylist 
      end
      end
    found_stylist
  end
# links clients to stylists
  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE clients_id = #{self.id};")
    clients.each do |client|
      name = client.fetch('name')
      clients_id = client.fetch('clients_id').to_i
      stylist_clients.push(Client.new(name: name, clients_id: clients_id))
    end
    stylist_clients
  end
# allows you to edit stylists
  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = id
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{id};")
    DB.exec("DELETE FROM clients WHERE clients_id = #{id};")
  end
end