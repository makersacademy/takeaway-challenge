require 'order'
require 'dish'
require 'pry'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu, dishes: [dish, dish2] }
  let(:dish) { Dish.new(name: "Pizza", price: 7.50) }
  let(:dish2) { Dish.new(name: "Soup", price: 3.20) }
  let(:dish1) { double :dish }

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
  
  context "when place order" do

    it 'shows the order total' do
      order.select_dish(dish, 2)
      order.select_dish(dish2, 1)
      expect(order.total).to eq 18.20
    end
  end
end