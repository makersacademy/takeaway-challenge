require 'meal'
require 'dish'

describe Meal do

  subject(:meal) { described_class.new }

  it 'stores a list of meal items (dishes)' do
    expect(meal.items).to be_an_instance_of Array
  end

  describe '#add_dish' do
    it 'adds a dish to the meal items' do
      expect{ meal.add_dish(Dish.new("One Pound Fish",1.00)) }.to change{ meal.items.length }
    end
  end

  describe '#remove_dish' do
    it 'removes a dish from the meal items' do
      dish = Dish.new("One Pound Fish",1.00)
      meal.add_dish(dish)
      expect{ meal.remove_dish(dish) }.to change{ meal.items.length }
    end
    it 'tells you when you try to remove a dish you do not already have in your meal' do
      expect{ meal.remove_dish("egg") }.to raise_error "That dish isn't part of your meal."
    end
  end

  describe '#total_cost' do
    it 'tells you the total cost of all the dishes in the meal' do
      meal.add_dish(Dish.new("One Pound Fish",1.00))
      meal.add_dish(Dish.new("Four Pound Fish",4.00))
      meal.add_dish(Dish.new("Fourty Pence Fish",0.40))
      expect(meal.total_cost).to eq 5.40
    end
  end

end
