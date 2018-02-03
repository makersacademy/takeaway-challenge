require 'restaurant'

describe Restaurant do

  subject(:restaurant) { Restaurant.new }

  it "contains a menu" do
    expect(restaurant.menu).to be_instance_of Hash
  end

  describe "#menu" do
    it "returns the menu" do
      expect(restaurant.menu).to eq restaurant.menu
    end
  end

end
