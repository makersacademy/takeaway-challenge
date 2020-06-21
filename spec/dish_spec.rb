require 'dish'

describe Dish do
  let(:dish) { Dish.new("pasta", 12.99) }
  
  describe "#initialize" do

    it "initializes with 2 values" do
      expect(dish).to have_attributes(name: "pasta", price: 12.99)
    end

  end
end
