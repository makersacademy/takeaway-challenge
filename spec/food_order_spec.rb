# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

require "food_order"

describe FoodOrder do
  
  subject { described_class.new }  

  describe "#add_dish" do
    it "adds dishes to the customer's basket" do
      subject.add_dish("curried_goat")
      subject.add_dish("fried_plantain")
      expect(subject.basket).to eq [{curried_goat: 7.50}, {fried_plantain: 2.00}]
    end
  end
end