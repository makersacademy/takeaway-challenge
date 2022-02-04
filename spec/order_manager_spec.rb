require_relative '../lib/order_manager'

describe OrderManager do
# I need to work out how to mock multiple dishes and have them used in the add_dishes_to_order iteration
# this is so I can test for multiple dishes

# Mock Dishes and Menu
  let(:dish_one) { double(:dish_one, :name => "Curry", :price => 6.5) }
  let(:dish_two) { double(:dish_two, :name => "Spagbol", :price => 7.5) }
  let(:dish_three) { double(:dish_three, :name => "Cottage Pie", :price => 8) }
  let(:menu_input) { [dish_one, dish_two, dish_three] }
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

    # it "parses the input of ordered dishes" do
    #   parsed_value = { "Spagbol" => 2, "Cottage Pie" => 1 }
    #   expect(order_manager.parse_order(ordered_dishes)).to eq parsed_value
    # end

    # it "gets the dishes from the menu" do
    #   order_hash = { "Spagbol" => 2 }
    #   expect(order_manager.add_dishes_to_order(order_hash)).to eq order
    # end

  end
end
