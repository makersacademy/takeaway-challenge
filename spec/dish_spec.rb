require "dish"

describe Dish do

  context "initialize" do

    before do
      @curry = Dish.new("curry", 5)
    end

    it "should have a name" do
      expect(@curry.name).to eq "curry"
    end

    it "should have a price" do
      expect(@curry.price).to eq 5
    end

  end
end
