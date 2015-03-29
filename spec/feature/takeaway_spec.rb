require 'capybara/rspec'
require 'menu'
require 'order'

feature 'customer places an order' do
  let(:test_menu) do
    { green_curry: 13.99,
      red_curry: 12.9,
      korma_chicken: 14.55 }
  end
  let(:menu) { Menu.new(test_menu) }
  let(:order) { Order.new }

  scenario 'customer retrieves the list of dishes with prices' do
    expect(menu.list).to eq test_menu
  end

  scenario 'customer adds selected dishes to order after verification' do
    menu.add_to_order(:red_curry, order)
    menu.add_to_order(:korma_chicken, order)
    expect do
      menu.add_to_order(:spice_alec, order)
    end.to raise_error 'Invalid Dish, Available Dishes in the Menu'
    expect(order.list).to eq([:red_curry, :korma_chicken])
  end

  scenario 'order is listed with prices and total payable amount' do
    menu.add_to_order(:red_curry, order)
    menu.add_to_order(:korma_chicken, order)
    expect(order.priced_list(menu)).to eq(red_curry: 12.9, korma_chicken: 14.55)
    expect(order.total_price(menu)).to eq 27.45
  end
end
