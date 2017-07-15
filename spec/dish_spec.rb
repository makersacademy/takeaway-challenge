require "dish"

describe Dish do
  subject(:dish) { described_class.new("Raw Vegan Lasagna", 6) }

  describe "initialization" do
    it "should receive a name at initialization" do
      expect(dish.name).to eq "Raw Vegan Lasagna"
    end

    it "should receive a price at initialization" do
      expect(dish.price).to eq 6
    end
  end
end
