require './lib/dish.rb'

describe Dish do
  NAME = 'korma'
  PRICE = 8

  subject(:Dish) { described_class.new(NAME, PRICE) }

  describe 'initilize' do
    it 'should create a Dish with a name' do
      expect(subject.name).to eq NAME
    end

    it 'should create a Dish with a price' do
      expect(subject.price).to eq PRICE
    end

    it 'should create a Dish with a default quantity of 0' do
      expect(subject.quantity).to eq 0
    end
  end
end
