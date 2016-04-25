require 'order'

describe Order do
  let(:restaurant_class) { double :restaurant_class }
  let(:dish) { double :dish }
  let(:quantity) { double :quantity }
  let(:menu) { double :menu, dish: 'Broccoli', price: '5,95',cinclude?: true }
  subject(:order) { described_class.new }

  describe '#initialize' do
    it 'creates a new order as an empty hash' do
      expect(order.basket).to be_empty
    end
  end

  describe '#add' do
    context 'selected dish is available' do
      it 'adds a dish to the basket' do
        order.add('Broccoli', 2)
        expect(order.basket).to eq('Broccoli'=>2)
      end
    end
    context 'selected dish is not available' do
      it 'raises an error' do
        expect{order.add('Carrot')}.to raise_error 'Dish not available'
      end
    end
  end

  describe '#summary' do
    it 'displays ordered dishes and prices' do
      order.add('Broccoli')
      expect(order.summary).to eq('Broccoli'=>'5.95')
    end
  end

  # describe '#total' do
  #   it 'calculates the price' do
  #   end
  # end

  describe '#checkout' do
    context 'price is correct' do
      # it 'sends the order to the restaurant' do
      #   allow(order).to receive(:correct_price?) {true}
      #   allow(restaurant_class).to receive(:complete_order)
      #   expect(order.checkout).to eq(restaurant_class.complete_order)
      # end
    end
    context 'price is incorrect' do
      it 'raises an error' do
        allow(order).to receive(:correct_price?) {false}
        expect{order.checkout}.to raise_error 'Incorrect price. Order cancelled'
      end
    end
  end
end









