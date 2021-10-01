# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require "food_order"

describe FoodOrder do

  let(:dish_list) { { test_dish1: 6.00, test_dish2: 4.00, test_dish3: 4.00 } } 
  let(:menu_double) { instance_double(Menu, menu: dish_list) }
  subject { described_class.new(menu_double) }

  describe "#add_dish" do
    it "adds dishes to the customer's basket" do
      subject.add_dish("test_dish1")
      subject.add_dish("test_dish2")
      expect(subject.basket).to eq [{ test_dish1: 6.00 }, { test_dish2: 4.00 }]
    end
  end

  describe "#total" do
    it "returns the total sum of all orders in the basket" do
      subject.add_dish("test_dish1")
      subject.add_dish("test_dish3")
      expect(subject.total).to eq 10
    end
  end
end
