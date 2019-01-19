require 'dish'

RSpec.describe Dish do

  context "#add" do
    let(:pizza) { described_class.new("Pizza", 10.49)}
    it "should return the name of the dish" do
      expect(pizza.dish_name).to eq "Pizza"
    end
    it "should return the price of the new dish" do
      expect(pizza.price).to eq 10.49
    end
    it "should return a float as price" do
      expect(pizza.price).to be_kind_of Float
    end
  end
end
