require "restaurant"

describe Restaurant do
  subject(:restaurant) {described_class.new}
  describe "when instantiated" do
    it "should have a default name" do
      expect(restaurant.name).to eq Restaurant::DEFAULT_NAME
    end

    it "should have an empty menu" do
      
    end
  end

end
