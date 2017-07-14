require('spec_helper')

describe(Stylist) do 

	describe('.all') do
    	it('starts off with no stylists') do
      		expect(Stylist.all).to(eq([]))
    	end
  	end

  	describe('#name') do
    	it('tells you its name') do
      		stylist = Stylist.new(name: 'WonderWoman', id: nil)
      		expect(stylist.name).to(eq('WonderWoman'))
    	end
  	end

	describe('#save') do
		it('saves stylist with name') do
			test_stylist = Stylist.new({:name => 'WonderWoman', :id => nil})
			test_stylist.save()
			expect(Stylist.all()).to(eq([test_stylist]))
		end
	end

	describe('#==') do
    	it('is the same stylist if the names of stylists are the same text') do
     		test_stylist = Stylist.new({:name => 'Arya', :id => nil})
      		new_stylist = Stylist.new({:name => 'Arya', :id => nil})
      		expect(test_stylist).to(eq(new_stylist))
    	end
  	end

	describe('.find') do
    	it('returns a stylist based on their unique id value') do
      		test_stylist = Stylist.new({:name => 'Arya', :id => nil})
      		test_stylist.save()
      		expect(Stylist.find(test_stylist.id())).to(eq(test_stylist))
    	end
  	end

	describe('#update') do
		it('lets you update stylists by name in the database')	do
			test_stylist = Stylist.new({:name => "Hermoine", :id => nil})
			test_stylist.save()	
			test_stylist.update({:name => "Emma"})
			expect(test_stylist.name()).to(eq("Emma"))
		end
	end

	describe('#delete') do
		it('lets you delete a stylist from the database') do
			test_stylist = Stylist.new({:name => "Black Widow", :id => nil})
			test_stylist.save()
			test_stylist2 = Stylist.new({:name => 'Joan of Arc', :id =>nil})
			test_stylist2.save()
			test_stylist.delete()
			expect(Stylist.all()).to(eq([test_stylist2]))
		end
	end
end			

