require './lib/restaurant.rb'

describe Restaurant do
  subject(:restaurant) { described_class.new}

  describe "#menu" do
    it "provides a list of dishes & prices" do
      expect(restaurant.menu).to eq(
        [{ food: 'Margarita', price: 10 },
        { food: 'Pepperoni', price: 12 },
        { food: 'Hawaiian', price: 12 },
        { food: 'Vegetarian', price: 11 },
        { food: 'BBQ Chicken', price: 13 },
        { food: 'Meaty', price: 14 },
        { food: 'Deluxe', price: 15 },
        { food: 'Veggie Volcano', price: 12 },
        { food: 'Ranch BBQ', price: 12 },
        { food: 'New Yorker', price: 14 },
        { food: 'Tandoori', price: 12 },
        { food: 'Texas BBQ', price: 13 }
      ])
    end
  end
end
