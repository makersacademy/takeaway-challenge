require 'capybara/rspec'
require 'menu'
require 'order'

feature 'customer places an order' do
  let(:test_menu) do
    { green_curry: 13.99,
      red_curry: 12.99,
      korma_chicken: 14.55 }
  end

  scenario 'customer retrieves the list of dishes with prices' do
    menu = Menu.new(test_menu)
    expect(menu.list).to eq test_menu
  end
end
