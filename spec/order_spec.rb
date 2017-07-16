require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu }

  let(:correct_cost) { 25 }
  let(:dish1) { double :dish1, name: "Burrito", price: 5 }
  let(:dish2) { double :dish2, name: "Pizza", price: 10 }
  let(:unserved_dish) { double :unserved_dish, name: "Waldorf Salad", price: 1000 }

  describe '#add_dish_to_order' do
    it 'should raise an error if the requested dish is not on the menu' do
      allow(menu).to receive(:includes?) { false }
      expect{ order.add_dish_to_order(unserved_dish) }.to raise_exception("Sorry, food safety regulations prevent us from serving #{unserved_dish.name}!")
    end

    it 'should add a dish and quantity to the order' do
      allow(menu).to receive(:includes?) { true }
      order.add_dish_to_order(dish1, 3)
      expect(order.basket).to include [dish1, 3]
    end
  end

  describe '#calculate_cost' do
    it 'should calculate the cost of an order' do
      allow(menu).to receive(:includes?) { true }
      order.add_dish_to_order(dish1, 3)
      order.add_dish_to_order(dish2, 1)
      expect(order.calculate_cost).to eq correct_cost
    end
  end
end
