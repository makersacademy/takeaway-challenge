require "restaurant"
describe Restaurant do
  let(:restaurant) { Restaurant.new }
  describe "#initialize" do
    it "checks that our dish hash is initialized" do
      expect(restaurant.dishes).to eq ({ 1 => ["Soup", 3.50], 2 => ["Chips", 4] })
    end
    it "checks that availability is set to false in the beginning" do
      expect(restaurant.availability).to eq false
    end
  end

  describe "#available?" do
    it "checks that we change the availability to true" do
      expect(restaurant).to be_available(1)
    end
  end
end
