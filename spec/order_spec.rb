require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish1) { { name: "Olives", price: 2, quantity: 3 } }
  let(:dish2) { { name: "Hummus", price: 1.5, quantity: 2 } }

  before do
    order.add(dish1)
    order.add(dish2)
  end

  describe '#add' do
    it 'allows to order the selected dish' do
      expect(order.dishes).to include(dish1, dish2)
    end
  end

  describe '#dishes' do
    it 'returns the dishes added to order in array' do
      expect(order.dishes).to include dish1, dish2
    end
  end

  describe '#review' do
    it 'returns items, prices, total price in readable format' do
      expect(order.review).to start_with("Your order")
    end
  end

  describe '#place' do
    it 'places the order and send a confirmation text message' do
      expect(order.place(false)).to eq true
    end
  end
end
