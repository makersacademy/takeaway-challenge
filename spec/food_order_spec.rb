# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

require "food_order"

describe FoodOrder do

  let(:dish_list) { { test_dish1: 6.00, test_dish2: 4.00, test_dish3: 4.00 } } 
  let(:menu_double) { instance_double(Menu, menu: dish_list) }
  subject { described_class.new(menu_double) }

  before(:example) do
    subject.add_dish("test_dish1")
    subject.add_dish("test_dish3")
  end

  describe "#add_dish" do
    it "adds dishes to the customer's basket" do
      expect(subject.basket).to eq [{ test_dish1: 6.00 }, { test_dish3: 4.00 }]
    end
  end

  describe "#total" do
    it "returns the total sum of all orders in the basket" do
      expect(subject.total).to eq 10
    end
  end

  describe "#check_total" do
    it "returns true if #total matches the sum of the dishes in the basket" do
      price = 10
      expect(subject.correct_total?(price)).to be_truthy
    end
  end
end
