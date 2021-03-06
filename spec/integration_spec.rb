require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new stylist', type: :feature) do
  it('allows user to add a stylist and view page') do
    visit('/')
    fill_in('name', :with => 'Wonderwoman')
    click_button('Add Stylist')

    # click_link('Return to Homepage')
    # expect(page).to have_content('Information for Wonderwoman')
  end
end

# describe('viewing all stylists', type: :feature) do
# 	it('allows users to see all stylists') do
# 		stylist = Stylist.new(name: 'Wonderwoman', id: nil)
# 		stylist.save
# 		visit('/')
# 		click_link('See all Stylists')
# 		expect(page).to have_content(stylist.name)
# 	end	
# end

describe('seeing details for a single Stylist', type: :feature) do
	it('allows a user to click a stylist and see her clients and their details') do
		test_stylist = Stylist.new(name: 'Hvedra', id: nil)
		test_stylist.save
		test_client = Client.new(name: 'Learn SQL', clients_id: test_stylist.id)
		test_client.save
		visit('/')
		click_link("Hvedra")
		expect(page).to have_content('Hvedra')
		# expect(page.find('#stylist').text).to eq "Hvedra"
	end	
end

describe('adding clients to a stylist', type: :feature) do
	it('allows a user to add a client to a stylist') do
		test_stylist = Stylist.new(name: 'Islanzadi', id:nil)
		test_stylist.save
		visit("stylist/#{test_client.id}")
		fill_in('Description', with: 'Learn SQL')
		click_button('Add Stylist')
		expect(page).to have_content('Success')
	end
end		