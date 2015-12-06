require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish1) { { name: "Olives", price: 2, quantity: 3 } }
  let(:dish2) { { name: "Hummus", price: 1.5, quantity: 2 } }

  describe '#add' do
    it 'should allow to order the selected dish' do
      order.add(dish1)
      order.add(dish2)
      expect(order.dishes).to include(dish1, dish2)
    end
  end

  describe '#review' do
    it 'should return items, prices, total price in readable format' do
      order.add(dish1)
      order.add(dish2)
      expect(order.review).to start_with("Your order")
    end
  end

  describe '#dishes' do
    it 'should return items, prices, total price in array' do
      order.add(dish1)
      order.add(dish2)
      expect(order.dishes).to include dish1, dish2
    end
  end

  describe '#place' do
    it 'should place the order and send a text message' do
      order.add(dish1)
      order.add(dish2)
      expect(order.place(false)).to eq true
    end
  end
end
