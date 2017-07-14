require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('add new stylist', {:type => :feature}) do
  it('allows user to add a stylist and view page') do
    visit('/')
    fill_in('stylist_name', :with => 'Wonderwoman')
    click_button('Add Stylist')
    click_link('Return to Homepage')
    click_link('Wonderwoman')
    expect(page).to have_content('Information for Wonderwoman')
  end
end

describe('change stylist name', {:type => :feature}) do
  it('allows user to change stylist name') do
    stylist = Stylist.new({:name => 'Wonderwoman', :id => nil})
    stylist.save()
    visit("/stylist/#{stylist.id()}")
    fill_in("new_name", :with => 'Batman')
    click_button('Update Name')
    expect(page).to have_content('Batman')
  end
end