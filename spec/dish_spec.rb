require 'dish'


describe Dish do
  subject(:dish) {described_class.new}

  describe "When instantiated" do

    it "should have a default price" do
      expect(dish.price).to eq Dish::DEFAULT_PRICE
    end

    it "should have a default name" do
      expect(dish.name).to eq "House Special"
    end

    it "should be able to have a new name" do
      dish = Dish.new("Barbican Tasty")
      expect(dish.name).to eq "Barbican Tasty"
    end

    it "should be able to have a new price" do
      dish = Dish.new("", 12)
      expect(dish.price).to eq 12
    end
  end

end
