require_relative '../lib/order'

describe Order do

  subject(:order) { described_class.new }

  let(:dish) { double(:dish, :name => "Spagbol", :price => 7.5) }
  let(:dish_two) { double(:dish, :name => "Cottage Pie", :price => 8) }
  let(:quantity_one) { 1 }
  let(:quantity_minus_one) { -1 }
  let(:quantity_zero) { 0 }
  let(:quantity_two) { 2 }

  describe "#add_dish" do
    # TODO add test/code for negative quantities
    # TODO add tests/code to remove items from the order

    it "adds to an order" do
      expect { order.order_dish(dish, 2) }.not_to raise_error
    end

    it "adds multiple dishes to an order" do
      order.order_dish(dish, quantity_two)
      order.order_dish(dish_two, quantity_one)
      expect(order.show_order).to eq "Dish: Spagbol, Qty: 2\nDish: Cottage Pie, Qty: 1\nTotal Price: £23.00"
    end

    it "updates the quantity when a duplicate dish is added" do
      order.order_dish(dish, quantity_two)
      order.order_dish(dish, quantity_two)
      expect(order.show_order).to eq "Dish: Spagbol, Qty: 4\nTotal Price: £30.00"
    end

    it "raises a error with negative quantities" do
      expect { order.order_dish(dish, quantity_minus_one) }.to raise_error "Quantity ordered needs to be greater than zero"  
    end

    it "raises an error if zero used as a quantity" do
      expect { order.order_dish(dish, quantity_zero) }.to raise_error "Quantity ordered needs to be greater than zero"  
    end
  end

  describe "#show_order" do
    it "returns the current order details" do
      order.order_dish(dish, quantity_two)
      expect(order.show_order).to eq "Dish: Spagbol, Qty: 2\nTotal Price: £15.00"
    end
  end

  describe "#total_price" do
    it "totals the price for the order" do
      order.order_dish(dish, quantity_two)
      expect(order.total_price).to eq 15
    end
  end

  describe "#confirm_order" do
    it "sends a text to confirm order" do
      
    end
  end

end
