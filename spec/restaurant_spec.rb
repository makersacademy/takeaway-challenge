require "restaurant"

describe Restaurant do
  subject(:restaurant) {described_class.new}
  describe "when instantiated" do
    it "should have a default name" do
      expect(restaurant.name).to eq Restaurant::DEFAULT_NAME
    end

    it "should have an empty menu" do
      expect(restaurant.menu).to be_empty
    end
  end

  describe "when handling the menu" do
    it "should be able to add a dish" do

    end
  end

end
