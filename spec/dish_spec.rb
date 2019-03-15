require 'dish'

describe Dish do
  let(:dish_36) { Dish.new(36, "Chicken Korma", 7.95) }
  let(:dish_27) { Dish.new(27, "Vegetable Biryani", 6.45) }

  context '#When checking what a dish is' do
    it "returns a string version of a Chicken Korma dish" do
      current_dish = "36. Chicken Korma £7.95"
      expect(dish_36.display).to eq current_dish
    end
  end

  context '#When checking what dishes are available' do
    it "returns only available dishes" do
      dish_36.make_unavailable
      expect(dish_36.display).to eq "Dish unavailable"
    end
  end

  context '#When checking the price of the dish' do
    it "returns the correct price" do
      expect(dish_36.price).to eq 7.95
    end
  end
end
