require 'dish'

describe Dish do
  describe '#initialize' do
    
    let(:name) { 'Curry' }
    let(:price) { 5 }
    let(:dish) { Dish.new(name, price) }

    it 'initializes with two arguments' do
      expect(Dish).to respond_to(:new).with(2)
    end

    it 'sets arguments as attributes' do
      expect(dish).to have_attributes(name: name, price: price)
    end
  end
end
