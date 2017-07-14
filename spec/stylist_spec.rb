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

  	describe('#id') do
  		it('sets its ID when you save it') do
  			stylist = Stylist.new(name: 'WonderWoman'. id: nil)
  			stylist.save
  			expect(stylist.id).to(be_an_instance_of(Integer))
  		end
  	end


	describe('#save') do
		it('saves stylist with name') do
			stylist = Stylist.new(name: 'WonderWoman', id: nil)
			stylist.save
			expect(Stylist.all()).to(eq([stylist]))
		end
	end

	describe('#==') do
    	it('is the same stylist if the names of stylists are the same') do
     		stylist1 = Stylist.new(name: 'Arya', :id => nil})
      		stylist2 = Stylist.new(name: 'Arya', :id => nil})
      		expect(stylist1).to(eq(stylist2))
    	end
  	end

	describe('.find') do
    	it('returns a stylist based on their unique id value') do
      		test_stylist = Stylist.new(name: 'Arya', id: nil)
      		test_stylist.save
      		test_stylist2 = Stylist.new(name: 'Emma', id: nil)
      		test_stylist2.save
      		expect(Stylist.find(test_stylist.id())).to(eq(test_stylist2))
    	end
  	end

  	describe('#clients') do
    it('returns an array of clients for that stylist') do
      test_stylist = Stylist.new(name: 'WonderWoman', id: nil)
      test_stylist.save
      test_client = Client.new(description: 'Learn SQL', stylist_id: test_stylist.id)
      test_client.save
      test_client2 = Client.new(description: 'Review Ruby', stylist_id: test_stylist.id)
      test_client2.save
      expect(test_stylist.clients).to(eq([test_client, test_client2]))
    end
  end
   describe('#update') do
    it('lets you update stylists in the database') do
      stylist = Stylist.new(name: 'WonderWoman', id: nil)
      stylist.save
      stylist.update(name: 'Thor')
      expect(stylist.name).to(eq('Thor'))
    end
  end

  describe('#delete') do
    it('lets you delete a stylist from the database') do
      stylist = Stylist.new(name: 'WonderWoman', id: nil)
      stylist.save
      stylist2 = Stylist.new(name: 'Thor', id: nil)
      stylist2.save
      stylist.delete
      expect(Stylist.all).to(eq([stylist2]))
    end
    it("deletes a stylist's clients from the database") do
      stylist = Stylist.new(name: 'WonderWoman', id: nil)
      stylist.save
      client = Client.new(description: 'learn SQL', stylist_id: stylist.id)
      client.save
      client2 = Client.new(description: 'Review Ruby', stylist_id: stylist.id)
      client2.save
      stylist.delete
      expect(Client.all).to(eq([]))
    end
  end
end			

