require 'restaurant'

describe Restaurant do
  let(:restaurant) {Restaurant.new}
  let(:dish_double) {double :dish}

  context "#initialize" do
    it "initializes with empty instance variable dishes (array) that can be called from outside the instance" do
      expect(restaurant.dishes).to eq []

    end
  end

  context "#create_dish" do
    it {is_expected.to respond_to(:create_dish).with(3)}

    it "adds instance of dish to dishes array" do
      allow(dish_double).to receive(:new) {dish_double}
      restaurant.create_dish("Burger", 10, dish_double)
      expect(restaurant.dishes).to eq [dish_double]
    end
  end
end
