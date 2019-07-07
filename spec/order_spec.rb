require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish, name: "Green Curry", price: 5 }
  let(:other_dish) { double :dish, name: "Red Curry", price: 6 }

  describe '#add_to_basket' do
    it 'should accept a dish from the Menu and add it to order' do
      order.add_to_basket(other_dish)
      expect(order.basket).to include other_dish
    end
  end
  describe '#remove_from_basket' do
    it 'should remove an item from the order' do
      order.remove_from_basket(0)
      expect(order.basket).not_to include dish
    end
  end
  describe '#basket' do
    it 'should return a list of all the items in the order' do
      order.add_to_basket(dish)
      expect(order.basket).to eq [dish]
    end
  end
  describe '#total' do
    it 'should return the total value of all the items in the order' do
      order.add_to_basket(other_dish)
      order.add_to_basket(dish)
      expect(order.total).to eq 11
    end
  end
end
