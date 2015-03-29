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

  scenario 'customer adds selected dishes to order after verification' do
    menu = Menu.new(test_menu)
    order = Order.new
    menu.add_to_order(:red_curry, order)
    menu.add_to_order(:korma_chicken, order)
    expect do
      menu.add_to_order(:spice_alec, order)
    end.to raise_error 'Invalid Dish, Available Dishes in the Menu'
    expect(order.list).to eq([:red_curry, :korma_chicken])
  end
end
