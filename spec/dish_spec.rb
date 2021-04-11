require 'dish'

describe Dish do

  describe '#initialize' do
      
    it "returns an instance of the Dish class" do
      dish = Dish.new('name', 'prize')
      expect(dish).to be_an_instance_of(Dish)
        
    end
  end
end
