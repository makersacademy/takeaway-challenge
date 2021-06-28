require 'dish'

describe Dish do
  let(:dish) { Dish.new "Spicy Noodles" }
  describe '#initialize' do
    it 'creates a dish with name' do
      expect(dish.name).to eq "Spicy Noodles"
    end
  end
end