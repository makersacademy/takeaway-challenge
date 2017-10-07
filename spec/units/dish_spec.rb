require 'dish'

describe Dish do
  name = 'Salad Caprese'
  price = 8.5
  subject(:dish) { described_class.new name, price }
  describe '#initialize' do
    it 'gives the instance a name' do
      expect(dish.name).to eq 'Salad Caprese'
    end
    it 'gives the instance a price' do
      expect(dish.price).to eq price
    end
    it 'gives the instance a quantity that defaults to zero' do
      expect(dish.quantity).to eq 0
    end
  end
  describe '#readable' do
    it 'returns a string' do
      expect(subject.readable).to be_a String
    end
    it 'which contains the name of the dish' do
      expect(subject.readable).to include name
    end
    it 'and the price of the dish' do
      expect(subject.readable).to include price.to_s
    end
  end
end
