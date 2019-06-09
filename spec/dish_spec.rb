require 'dish'

describe Dish do
  describe '#initialised' do

    before(:each) do
      @dish = Dish.new("Something yummy", 9.99)
    end
  
    it 'is initialised with a name' do
      expect(@dish.name).to eq("Something yummy")
    end

    it 'is initialised with a price' do
      expect(@dish.price).to eq(9.99) 
    end
  end
end
