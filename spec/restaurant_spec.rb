require 'restaurant'

describe Restaurant do
  let(:restaurant) {Restaurant.new}
  let(:real_dish) {Dish}
  let(:dish_double_1) {double :dish1}
  let(:dish_double_2) {double :dish2}
  let(:dish_double_3) {double :dish3}

  before :each do
    allow(dish_double_1).to receive(:new) {dish_double_1}
    allow(dish_double_1).to receive(:name) {"burger"}
    allow(dish_double_1).to receive(:price) {10}
    allow(dish_double_1).to receive(:remove_portion)

    allow(dish_double_2).to receive(:new) {dish_double_2}
    allow(dish_double_2).to receive(:name) {"pizza"}
    allow(dish_double_2).to receive(:remove_portion)
    allow(dish_double_2).to receive(:price) {7.5}
    allow(dish_double_3).to receive(:new) {dish_double_3}
    allow(dish_double_3).to receive(:name) {"chicken"}
    allow(dish_double_3).to receive(:price) {8}
    allow(dish_double_3).to receive(:remove_portion)

  end



  context "#initialize" do
    it "initializes with empty instance variable dishes (array) that can be called from outside the instance" do
      expect(restaurant.dishes).to eq []

    end
  end

  context "#create_dish" do
    it {is_expected.to respond_to(:create_dish).with(3)}

    it "adds instance of dish to dishes array" do

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

  context "#hold_portion_of_requested_dish_order" do
    it "returns an hash" do
      restaurant.create_dish("burger", 10, dish_double_1)
      expect(restaurant.hold_portion_of_requested_dish("burger")).to be_a(Hash)
    end

    it "returns and hash with dish name as key and price as value" do
      restaurant.create_dish("burger", 10, dish_double_1)
      restaurant.create_dish("pizza", 7.5, dish_double_2)
      restaurant.create_dish("chicken", 8, dish_double_3)
    
      expect(restaurant.hold_portion_of_requested_dish("burger")).to eq({burger: 10})
    end

    # I've used a real instance of dish for this test

    it "it removes a portion from the selected dish" do
      restaurant.create_dish("burger", 10)
      restaurant.create_dish("pizza", 7.5, dish_double_2)
      restaurant.create_dish("chicken", 8, dish_double_3)

      restaurant.hold_portion_of_requested_dish("burger")
      expect(restaurant.dishes[0].remaining_portions).to eq 4

    end
  end
end
