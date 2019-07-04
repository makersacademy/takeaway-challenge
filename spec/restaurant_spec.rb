require './lib/restaurant.rb'

describe Restaurant do
  subject(:restaurant) { described_class.new}

  describe "#menu" do
    it "provides a list of dishes & prices" do
      expect(restaurant.menu).to eq("Margarita: 12, Hawaiin: 14")
    end
  end
end