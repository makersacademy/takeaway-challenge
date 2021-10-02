require './lib/dish'

describe Dish do

  describe '#initialize' do
    it 'is initialised with a name' do
      d1 = Dish.new("Chicken Korma", 8.99)
      expect(d1.name).to eq "Chicken Korma"
    end
    it 'is initialised with a price' do
      d1 = Dish.new("Chicken Korma", 8.99)
      expect(d1.price).to eq 8.99
    end
  end
  
end
