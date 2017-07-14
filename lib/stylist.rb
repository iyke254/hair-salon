class Stylist
  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

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
      found_stylist = stylist if stylist.id.==(id)
    end
    found_stylist
  end

  define_method(:clients) do
    stylist_clients = []
    clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{id};")
    clients.each do |client|
      description = client.fetch('description')
      stylist_id = client.fetch('list_id').to_i
      stylist_clients.push(Client.new(description: description, stylist_id: stylist_id))
    end
    stylist_clients
  end

  define_method(:update) do |attributes|
    @name = attributes.fetch(:name)
    @id = id
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{id};")
    DB.exec("DELETE FROM clients WHERE stylist_id = #{id};")
  end
end