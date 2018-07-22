require "dish"
describe Dish do
  subject(:dish) { Dish.new }

  describe "#initialize" do
    it "Iniitalisez with a default name, meat" do
      expect(dish.name).to eq("meat")
    end
    it "Iniitalisez with a default price, 10" do
      expect(dish.price).to eq(10)
    end
  end 
end 