require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  describe "Creating the menu" do
    let(:dish) { double("tofu") }
    let(:price) { double("£9") }
    it "adds items to menu" do
      expect(restaurant.create(dish, price)).to eq ({dish => price})
    end

    # it "removes items from menu" do
    #   expect(restaurant.remove(dish)).not_to eq dish
    # end
  end
end
