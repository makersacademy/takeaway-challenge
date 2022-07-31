require "meal"

describe Meal do

  describe '#initialize' do

    it 'initializes with a number, name and price' do
      meal = Meal.new(:number, :name, :price)
      expect(meal.number).to eq :number
      expect(meal.name).to eq :name
      expect(meal.price).to eq :price
    end
  end
end
