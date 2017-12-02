require 'menu'
require 'order'

describe Order do
  let(:menu) { double(:menu, print_dishes: Array) }
  let (:order) { Order.new(menu) }

  it 'should initialize with a list of dishes' do
    expect(order.menu).to eq(menu)
  end 

  it 'should allow the user to place an order' do
    expect(order.place_order).to eq(menu.print_dishes)
  end
end
