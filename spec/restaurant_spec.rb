require "restaurant"

describe Restaurant do

  subject(:restaurant) { described_class.new("mcdonalds") }

  describe "#initialize" do
    it "ensures a new restaurant gets initialized with a name" do
      expect(restaurant.name).to eq("mcdonalds")
    end
  end
end
