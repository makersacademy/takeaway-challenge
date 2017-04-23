require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu: menu, order: order) }

  let(:menu) { double(:menu, print_menu: food_list) }
  let(:food_list) { "Pizza: £5.00" }

  let(:order) { double(:order, total: 7.50) }
  let(:menu_items) { { burger: 2, fries: 1 } }

  it 'shows menu of food and prices' do
    expect(restaurant.show_menu).to eq(food_list)
  end

  it 'can order items from the menu' do
    expect(order).to receive(:add).twice
    restaurant.place_order(menu_items)
  end

  it 'calculates the order total' do
    allow(order).to receive(:add)
    total = restaurant.place_order(menu_items)
    expect(total).to eq(7.50)
  end

end
