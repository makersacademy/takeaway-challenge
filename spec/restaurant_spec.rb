require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new }

  it "contains a menu" do
    expect(Restaurant::MENU).to be_instance_of Hash
  end

  describe "#menu" do
    it "returns the menu" do
      expect(restaurant.menu).to eq Restaurant::MENU
    end
  end

end
