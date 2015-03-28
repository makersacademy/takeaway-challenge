require 'capybara/rspec'
require 'restaurant'

feature 'lists dishes' do
  scenario 'returns list of dishes with prices' do
    menu = Restaurant.new
    expect(menu.list[0..28]).to eq "flame_grilled_pheonix: £12.00"
  end
end
