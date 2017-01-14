require 'meal'
require 'restaurant'

describe Meal do
  subject(:meal){ described_class.new("") }
  let(:dish){instance_double("Dish")}
  let(:dish2){instance_double("Dish")}

  restaurant = Restaurant.new
  before do
    allow(dish).to receive(:name){"dish"}
    allow(dish).to receive(:price){1}
    allow(dish2).to receive(:name){"dish2"}
    allow(dish2).to receive(:price){1}
  end

  it {should respond_to(:select_dishes)}

  describe "#select_dishes" do
    it "selects a dish" do
      restaurant.dishes << dish
      expect(meal.select_dishes(restaurant, "dish")).to include(dish)
    end
    it "selects multiple dishes" do
      restaurant = Restaurant.new
      restaurant.dishes << dish
      restaurant.dishes << dish2
      expect(meal.select_dishes(restaurant, "dish", "dish2")).to include(dish, dish2)
    end
    it "raises an error if no dishes selected" do
      expect{meal.select_dishes(restaurant)}.to raise_error(RuntimeError)
    end
  end

  describe "#view_prices" do
    it "shows the selected meal's prices" do
      restaurant = Restaurant.new
      restaurant.dishes << dish
      restaurant.dishes << dish2
      meal.select_dishes(restaurant, "dish", "dish2")
      expect(meal.view_prices).to include(dish.price, dish2.price)
    end
    it "raises an error if no dishes selected" do
      expect{meal.view_prices}.to raise_error(RuntimeError)
    end
  end

  describe "#total_price" do
    it "shows the selected meal's total price" do
      restaurant = Restaurant.new
      restaurant.dishes << dish
      restaurant.dishes << dish2
      meal.select_dishes(restaurant, "dish", "dish2")
      total = dish.price + dish2.price
      expect(meal.total_price).to eq(total)
    end
  end
end
