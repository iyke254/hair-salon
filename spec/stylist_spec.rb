require('spec_helper')

describe(Stylist) do 

	describe('#initialize') do
		it('returns the name of the stylist') do
			test_stylist = Stylist.new({:name => 'WonderWoman', :id => nil})
			expect(test_stylist.name()).to(eq('WonderWoman'))
		end	
	end	

	describe('#save') do
		it('saves stylist with name') do
			test_stylist = Stylist.new({:name => 'WonderWoman', :id => nil})
			test_stylist.save()
			expect(Stylist.all()).to(eq([test_stylist]))
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

	