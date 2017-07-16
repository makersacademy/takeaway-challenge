require "dish"

describe Dish do
  let(:dish_name) { "Raw Vegan Lasagna" }
  let(:dish_price) { 6 }
  let(:dish_type) { "Main Course" }
  subject(:dish) { described_class.new(dish_name, dish_price, dish_type) }

  describe "initialization" do
    it "should receive a name at initialization" do
      expect(dish.name).to eq dish_name
    end

    it "should receive a price at initialization" do
      expect(dish.price).to eq dish_price
    end

    it "should receive a type at initialization" do
      expect(dish.type).to eq dish_type
    end
  end
end
