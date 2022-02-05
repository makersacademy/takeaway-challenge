require_relative '../lib/order_manager'

describe OrderManager do

# Mock Dishes and Menu
  let(:dish_one) { double(:dish_one, :name => "Curry", :price => 6.5) }
  let(:dish_two) { double(:dish_two, :name => "Spagbol", :price => 7.5) }
  let(:menu_input) { [dish_one, dish_two] }
  let(:menu) { double(:menu, :select_dish => "Spagbol") }

# Mock Order
  let(:order) { double(:order, :add_dish => nil, :show_order => "Dish: Spagbol, Qty: 2\nDish: Cottage Pie, Qty: 1\nTotal Price: £23.00") }
  let(:order_class) { double(:order_class, :new => order) }

  let(:ordered_dishes) { "Spagbol,2,Cottage Pie,1" }

  subject(:order_manager) { described_class.new(menu, order_class) }

  context "creates an order from a string input" do
    it "generates an order" do
      expect(order_manager.generate_order(ordered_dishes)).to eq order
    end

    it "creates a nil object if string empty" do
      expect(order_manager.generate_order("")).to be_nil
    end
  end

  describe "#show_order" do
    it "shows the order" do
      order_manager.generate_order(ordered_dishes)
      expect(order_manager.show_order).to eq "Dish: Spagbol, Qty: 2\nDish: Cottage Pie, Qty: 1\nTotal Price: £23.00"
    end
  end
end
