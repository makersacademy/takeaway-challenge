require 'order'
require 'dish'
require 'pry'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu, print_menu: [dish] }
  let(:dish) { Dish.new(name: "Pizza", price: 7.99) }
  let(:dish1) { double :dish }

  it 'shows a list of dishes' do
    expect(order.show_menu).to eq [dish]
  end

  context "when dish not in menu" do
    it 'raises an error' do
      expect { order.select_dish(dish1, 4) }.to raise_error "The dish is not in the menu"
    end
  end

  context "when dish in menu" do
    it 'gives it a quatity' do
      dish.quantity = 4
      expect(order.select_dish(dish, 4)).to eq dish
    end
  end
  
  # it 'raises an error when quantity not equal total' do
  #   total = 4
  #   dish.quantity = 4
  #   expect(order.)
  # end
end