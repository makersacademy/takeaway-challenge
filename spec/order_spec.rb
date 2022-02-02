require_relative '../lib/order'

describe Order do

  subject(:order) { described_class.new }

  let(:dish) { double(:dish, :name => "Spagbol", :price => 7.5 )}
  let(:dish_two) { double(:dish, :name => "Cottage Pie", :price => 8 )}


  describe "#add_dish" do
    # TODO add test/code for negative quanities
    # TODO add tests/code to remove items from the order

    it "adds to an order" do
      expect{ order.add_dish(dish, 2) }.not_to raise_error
    end

    it "adds multiple dishes to an order" do
      order.add_dish(dish, 2)
      order.add_dish(dish_two, 1)
      expect(order.show_order).to eq "Dish: Spagbol, Qty: 2\nDish: Cottage Pie, Qty: 1"
    end

    it "updates the quantity when a duplicate dish is added" do
      order.add_dish(dish, 2)
      order.add_dish(dish, 2)
      expect(order.show_order).to eq "Dish: Spagbol, Qty: 4"
    end

  end

  describe "#show_order" do
    it "returns the current order details" do
      order.add_dish(dish, 2)
      expect(order.show_order).to eq "Dish: Spagbol, Qty: 2"
    end
  end

end