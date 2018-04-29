require 'dish'

describe Dish do
  describe '#initialize' do

    let(:name) { 'Steak' }
    let(:price) { 25 }
    let(:dish) { Dish.new(name, price) }

    it 'initializes with two arguments' do
      expect(Dish).to respond_to(:new).with(2)
    end

    it 'assigns the arguments as attributes' do
      expect(dish).to have_attributes(name: name, price: price)
    end
  end
end
