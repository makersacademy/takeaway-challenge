require "dish"
describe Dish do
  subject(:dish) { Dish.new }
  let(:name_of_dish) { "Shrimp fried rice" }
  let(:price_of_dish) { 15 }

  describe "#initialize" do
    it "iniitalizes with a default name, meat" do
      expect(dish.details[:name]).to eq("meat")
    end
    it "iniitalizes with a default price, 10" do
      expect(dish.details[:price]).to eq(10)
    end

    it "allows name to be set when initialized" do
      new_dish = Dish.new(name_of_dish)
      expect(new_dish.details[:name]).to eq name_of_dish  
    end

    it "allows price to be set when initialized" do
      new_dish = Dish.new(nil, price_of_dish)
      expect(new_dish.details[:price]).to eq price_of_dish  
    end
  end 
end
