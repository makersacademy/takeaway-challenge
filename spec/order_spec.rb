require './lib/order'

describe Order do
let(:dish_01) { double(:dish, :name => "Saag Paneer", :description => "Cheesy green goodness", :price => 4) }
let(:dish_02) { double(:dish, :name => "Saag Aloo", :description => "Potatoey green goodness", :price => 4) }
let(:dish_03) { double(:dish, :name => "Onion Bhaji", :description => "Chopped onion, deep friend", :price => 2) }
let(:menu) { double(:menu, :dishes => [dish_01, dish_02, dish_03]) }
subject(:order) { described_class.new(menu) }

  describe "#Select_Dish" do
    it "Can select a dish by number" do
      order.select_dish(1)
      expect(order.meal).to include dish_01
    end
    it "Can select a dish by name" do
      order.select_dish("Saag Aloo")
      expect(order.meal).to include dish_02
    end
  end
end
