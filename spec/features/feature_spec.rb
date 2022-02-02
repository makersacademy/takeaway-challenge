require_relative '../../lib/dish'

# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices
describe "feature tests" do 

  let(:dish_one) { Dish.new("Curry", 6.5) }
  let(:dish_two) { Dish.new("Spagbol", 7.5) }
  let(:dish_three) { Dish.new("Cottage Pie", 8) }
  
  let(:menu_input) { [dish_one, dish_two, dish_three] }
  let(:menu_output) { "Curry, Price: £6.50\nSpagbol, Price: £7.50\nCottage Pie, Price: £8.00" }

  describe "user story 1" do
    
    it "creates a menu" do
      menu = Menu.new(menu_input)
      expect(menu).to be_instance_of(Menu)
    end

    it "shows what is on the menu" do
      menu = Menu.new(menu_input)
      expect(menu.show_menu).to eq menu_output
    end
    
    it "can create a dish" do
      dish = Dish.new("Cottage Pie", 8.51)
      expect(dish.name).to eq "Cottage Pie"
      expect(dish.price).to eq 8.51
    end

  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  describe "User Story 2" do
    it "selects a dish from the menu" do
      menu = Menu.new(menu_input)
      dish_selected = menu.select_dish("Cottage Pie")
      expect(dish_selected.name).to eq "Cottage Pie"
    end

    it "open an order" do
      order = Order.new()
      expect(order).to be_instance_of(Order)
    end

    it "adds a dish to an order" do
      menu = Menu.new(menu_input)
      dish_selected = menu.select_dish("Cottage Pie")
      order = Order.new
      order.order_dish(dish_selected, 2)
      expect(order.show_order).to eq "Dish: Cottage Pie, Qty: 2\nTotal Price: £16.00"
    end
  end

  #  As a customer
  #  So that I can verify that my order is correct
  #  I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe "User Story 3" do
    it "shows the overall price of an order" do
      menu = Menu.new(menu_input)
      dish_selected = menu.select_dish("Cottage Pie")
      order = Order.new
      order.order_dish(dish_selected, 2)
      expect(order.total_price).to eq 16
    end

    it "shows the overall order with total price" do
      menu = Menu.new(menu_input)
      dish_selected = menu.select_dish("Cottage Pie")
      order = Order.new
      order.order_dish(dish_selected, 2)
      expect(order.show_order).to eq "Dish: Cottage Pie, Qty: 2\nTotal Price: £16.00"
    end
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
  describe "User Story 4" do
    it "sends a text on order confirmation" do
      menu = Menu.new(menu_input)
      dish_selected = menu.select_dish("Cottage Pie")
      order = Order.new
      order.order_dish(dish_selected, 2)
      # order.confirm_order
    end
  end

  
end
