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
    it "Raises an error if selection number isn't in the menu" do
      expect{ order.select_dish(6) }.to raise_error "Sorry, I don't recognise that dish, please try again"
    end
    it "Raises an error if selection name isn't in the menu" do
      expect{ order.select_dish("Big Mac") }.to raise_error "Sorry, I don't recognise that dish, please try again"
    end
  end

  describe "#View_meal" do
    it "Can display the contents of the current meal and total cost" do
      order.select_dish(1)
      expect { order.view_meal }.to output("Item: 1, Saag Paneer, £4, X1.\nTOTAL: £4\n").to_stdout
    end
    it "Can display multiple contents of the current meal and total cost" do
      order.select_dish(1)
      order.select_dish(2)
      expect { order.view_meal }.to output("Item: 1, Saag Paneer, £4, X1.\nItem: 2, Saag Aloo, £4, X1.\nTOTAL: £8\n").to_stdout
    end
    it "Updates the count of an item if it is selected more than once" do
      order.select_dish(1)
      order.select_dish(1)
      expect { order.view_meal }.to output("Item: 1, Saag Paneer, £4, X2.\nTOTAL: £8\n").to_stdout
    end
  end

  describe "#Remove_dish" do
    it "removes selected (by number) dish from meal" do
      order.select_dish(1)
      order.select_dish(2)
      order.remove_dish(1)
      expect(order.meal).not_to include dish_01
    end
    it "removes selected (by name) dish from meal" do
      order.select_dish(1)
      order.select_dish(2)
      order.remove_dish("Saag Paneer")
      expect(order.meal).not_to include dish_01
    end
    it "Only removes one instance of selected (by number) dish from meal" do
      2.times { order.select_dish(1) }
      order.remove_dish(1)
      expect { order.view_meal }.to output("Item: 1, Saag Paneer, £4, X1.\nTOTAL: £4\n").to_stdout
    end
    it "Only removes one instance of selected (by name) dish from meal" do
      2.times { order.select_dish(1) }
      order.remove_dish("Saag Paneer")
      expect { order.view_meal }.to output("Item: 1, Saag Paneer, £4, X1.\nTOTAL: £4\n").to_stdout
    end
    it "Raises an error if selection number isn't in the meal" do
      order.select_dish(1)
      expect{ order.remove_dish(6) }.to raise_error "Sorry, I don't recognise that dish, please try again"
    end
    it "Raises an error if selection name isn't in the meal" do
      expect{ order.remove_dish("Big Mac") }.to raise_error "Sorry, I don't recognise that dish, please try again"
    end
  end
end
