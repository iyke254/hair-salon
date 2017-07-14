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