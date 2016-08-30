require 'dish'

describe Dish do

  subject(:dish) { described_class.new(1012, "Pizza", 4.99)}

  describe "#initialize" do
    it "stores the dish ID properly" do
      expect(dish.id).to eq 1012
    end

    it "stores the name of the dish properly" do
      expect(dish.name).to eq "Pizza"
    end

    it "stores the price of the dish properly" do
      expect(dish.price).to eq 4.99
    end
  end
end
