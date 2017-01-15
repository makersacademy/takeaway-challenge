require 'dishes.rb'

describe Dish do

  describe 'initialize' do
    dish1 = Dish.new('noodles', 5)
    it 'creates an instance of Dish' do
      expect( dish1 ).to be_a(Dish)
    end
    it 'has a name' do
      expect(dish1.name).to eq('noodles')
    end
    it 'has a price' do
      expect(dish1.price).to eq(5)
    end
  end
end
