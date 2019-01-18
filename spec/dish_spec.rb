require 'dish'

describe Dish do
  describe "#name" do
    it 'returns the first argument with which it is initialized' do
      pizza = Dish.new("Pizza", 15)
      expect(pizza.name).to eq "Pizza"
    end
  end

  describe "#price" do
    it 'returns the second argument with which it is initialized' do
      pizza = Dish.new("Pizza", 15)
      expect(pizza.price).to eq 15
    end
  end
end
