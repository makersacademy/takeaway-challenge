require './lib/restaurant.rb'

describe Restaurant do
  subject(:restaurant) { described_class.new}

  describe "#menu" do
    it "provides a list of dishes & prices" do
      expect(restaurant.menu).to eq(
        [{ food: 'Margarita', price: 10 },
        { food: 'Peperoni', price: 12 },
        { food: 'Hawaiin', price: 12 },
        { food: 'Vegetarian', price: 11 }])
    end
  end
end
