require 'dish'

RSpec.describe Dish do

  let(:dish) { Dish.new("Chicken Katsu Curry", 6) }

  describe '#name' do
    it "should return the dish's name" do
      expect(dish.name).to eq "Chicken Katsu Curry"
    end
  end

  describe '#price' do
    it "should return the dish's price" do
      expect(dish.price).to eq 6
    end
  end
end