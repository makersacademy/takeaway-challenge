require "dish"

describe Dish do

  subject(:dish) { described_class.new("burger", 7) }

  describe "#initialize" do
    it "ensures a new dish gets initialized with a name" do
      expect(dish.name).to eq "burger"
    end
    it "ensures a new dish gets initialized with a price" do
      expect(dish.price).to eq 7
    end
  end

end
