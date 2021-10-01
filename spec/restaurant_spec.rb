require "restaurant"
describe Restaurant do
  describe "#initialize" do
    it "checks that our dish hash is initialized" do
      restaurant = Restaurant.new
      expect(restaurant.dishes).to eq ({ 1 => ["Soup", "£3.50"], 2 => ["Chips", "£4"] })
    end
    it "checks that availability is set to false in the beginning" do
      restaurant = Restaurant.new
      expect(restaurant.availability).to eq false
    end
  end

  describe "#available?" do
    it "checks that we change the availability to true" do
      restaurant = Restaurant.new
      expect(restaurant).to be_available("soup")
    end
  end
end
