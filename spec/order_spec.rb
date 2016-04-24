require 'order'

describe Order do
  let(:menu) { double :menu, price: '£1.00', contains?: true }
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
    order.add('Broccoli', 1)
      expect(order.summary).to eq("Broccoli"=>"5.95")
    end
  end

  # describe '#to_pay' do
  #   it 'calculates the price' do
  #     expect

  #   end
  # end

  describe '#checkout' do
    # context 'price is correct' do
    #   it 'sends the order to the restaurant' do

    #   end
    # end
    # context 'price is incorrect' do
    #   it 'raises an error' do
    #     expect
    #   end
    # end
  end
end