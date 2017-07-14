require('spec_helper')

describe(Client) do 

	describe('#initialize') do 
		it('returns the name of the client') do
			test_client = Client.new({:name => 'Eragon', :id => nil, :stylist_id => 1})
			expect(test_client.name()).to(eq('Eragon'))
		end
	end

	describe('#save') do
   	 	it('saves client with a name') do
     		test_client = Client.new({:name => 'Eragon', :id => nil, :stylist_id => 1})
      		test_client.save()
      		expect(Client.all()).to(eq([test_client]))
    	end
    end

    describe('#==') do
    	it('is the same client if the names are the same text') do
      		test_client = Client.new({:name => 'Eragon', :id => nil, :stylist_id => 1})
      		new_client = Client.new({:name => 'Eragon', :id => nil, :stylist_id => 1})
      		expect(test_client).to(eq(new_client))
    	end
    end