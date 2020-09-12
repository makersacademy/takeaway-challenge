require 'dish'

describe Dish do
  describe '#initialize' do
    it 'creates a dish with name' do
      dish = Dish.new("Spicy Noodles")
      expect(dish.name).to eq "Spicy Noodles"
    end
  end
end