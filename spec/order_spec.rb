require 'order'
require 'dish'
require 'pry'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu, print_menu: [dish] }
  let(:dish) { Dish.new(name: "Pizza", price: 7.99) }

  it 'selects a dish and give it a quatity' do
    selected_dish = menu.print_menu.pop
    selected_dish.quantity = 4
    expect(order.select_dish(4)).to eq selected_dish
  end

end