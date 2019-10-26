require 'restaurant'

describe Restaurant do
  let(:restaurant) {Restaurant.new}
  let(:dish_double_1) {double :dish1}
  let(:dish_double_2) {double :dish2}
  let(:dish_double_3) {double :dish3}

  before :each do
    allow(dish_double_1).to receive(:new) {dish_double_1}
    allow(dish_double_2).to receive(:new) {dish_double_2}
    allow(dish_double_3).to receive(:new) {dish_double_3}
  end

  context "#initialize" do
    it "initializes with empty instance variable dishes (array) that can be called from outside the instance" do
      expect(restaurant.dishes).to eq []

    end
  end

  context "#create_dish" do
    it {is_expected.to respond_to(:create_dish).with(3)}

    it "adds instance of dish to dishes array" do
      allow(dish_double_1).to receive(:new) {dish_double_1}
      restaurant.create_dish("Burger", 10, dish_double_1)
      expect(restaurant.dishes).to eq [dish_double_1]
    end
  end

  context "#availabilty_checker" do
    it "removes dish if there are no more portions available " do
      allow(dish_double_1).to receive(:remaining_portions) {2}
      allow(dish_double_2).to receive(:remaining_portions) {0}
      allow(dish_double_3).to receive(:remaining_portions) {1}
      restaurant.create_dish("fish", 8, dish_double_1)
      restaurant.create_dish("Burger", 10, dish_double_2)
      restaurant.create_dish("Pizza", 7.4, dish_double_3)
      restaurant.availabilty_checker
      expect(restaurant.dishes).to_not include(dish_double_2)

    end
  end
end
