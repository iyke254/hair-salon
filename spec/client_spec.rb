require('spec_helper')

describe(Client) do 

	describe('#initialize') do 
		it('returns the name of the client') do
			test_client = Client.new({:name => 'Harry Potter', :id => nil, :stylist_id => 1})
			expect(test_client.name()).to(eq('Harry Potter'))
		end
	end

	