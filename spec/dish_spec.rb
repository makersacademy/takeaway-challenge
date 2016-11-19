require 'dish'

describe Dish do

  let (:dish) {described_class.new(dish_name, dish_price)}
  let (:dish_name) {double :dish_name}
  let (:dish_price) {double :dish_price}

  describe "New instance of a dish" do
    it "should expose the name of a dish" do
      expect(dish.name).to eq dish_name
    end

    it "should expose the price of a dish" do
      expect(dish.price).to eq dish_price
    end


  end

end
