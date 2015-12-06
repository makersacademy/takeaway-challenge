require 'order'

describe Order do
  let(:order) { described_class.new}
  let(:item) { double :item, name: 'Satay', price: '4.50'}
  let(:quantity) { 3 }

  describe '#add' do
    it 'allows a customer to add an item to the basket' do
      expect { order.add(item) }.not_to raise_error
    end

    it 'stores an added item in the basket' do
      order.add(item)
      expect(order.basket).to have_key(item)
    end

    it 'allows a customer to add multiples of an item' do
      order.add(item, quantity)
      basket = { item => quantity }
      expect(order.basket).to eq basket
    end

    it 'stores an added item in the basket with a default of 1' do
      order.add(item)
      basket = { item => 1 }
      expect(order.basket).to eq basket
    end

    it 'adds to the quantity of an item if it is already in the order' do
      3.times { order.add(item) }
      basket = { item => 3 }
      expect(order.basket).to eq basket
    end
  end
end
