require "dish"

describe Dish do
  let(:dish) { Dish.new("Carbonara", 10) }

  describe "#name" do
    it "returns the dish's name" do
      expect(dish.name).to eq "Carbonara"
    end
  end

  describe "#price" do
    it "returns the dish's price" do
      expect(dish.price).to eq 10
    end
  end

end
