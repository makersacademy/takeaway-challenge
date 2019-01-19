require 'basket'

describe Basket do

  let(:new_order)   { described_class.new }
  let(:hummus)  { { name: "Hummus", price: 2 } }
  let(:pizza)   { { name: "Pizza", price: 10 } }

  describe 'Starting a new Basket' do
    it 'should be initialized with no items in the basket' do
      expect(subject.basket).to eq []
    end
  end

  describe 'Adding an item to the basket' do
    it 'should be able to add an item to it\'s basket array' do
      new_order.add(hummus)
      expect(new_order.basket).to include(hummus)
    end
  end

  describe 'Calculating the cost of the basket' do
    it 'should calculate the cost of the basket' do
      allow(new_order).to receive(:basket).and_return([hummus, pizza])
      expect(new_order.cost).to eq 12
    end
  end

  describe 'Returning the order' do
    it 'should return a list of items in the basket and the cost' do
      new_order.add(hummus)
      new_order.add(pizza)
      expect { new_order.return_order }.to output("Hummus\nPizza\nTotal: £12\n").to_stdout
    end
  end
end
