require_relative '../../lib/dish'
require_relative '../../lib/order_server'
require_relative '../../lib/order_manager'
require_relative '../../lib/order'
require_relative '../../lib/menu'
require 'sinatra'
require 'dotenv/load'

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
      menu = Menu.new(Dish)
      expect(menu).to be_instance_of(Menu)
    end
    
    it "can load a menu from file" do
      menu = Menu.new
      menu.load_menu('./data/menu.csv')
      expect(menu.show_menu).to eq menu_output
    end

    it "shows what is on the menu" do
      menu = Menu.new(Dish)
      menu.load_menu('./data/menu.csv')
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
      menu = Menu.new
      menu.load_menu('./data/menu.csv')
      dish_selected = menu.select_dish("Cottage Pie")
      expect(dish_selected.name).to eq "Cottage Pie"
    end

    it "open an order" do
      order = FoodOrder.new()
      expect(order).to be_instance_of(FoodOrder)
    end

    it "adds a dish to an order" do
      menu = Menu.new
      menu.load_menu('./data/menu.csv')
      dish_selected = menu.select_dish("Cottage Pie")
      order = FoodOrder.new
      order.order_dish(dish_selected, 2)
      expect(order.show_order).to eq "Dish: Cottage Pie, Qty: 2\nTotal Price: £16.00"
    end
  end

  #  As a customer
  #  So that I can verify that my order is correct
  #  I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe "User Story 3" do
    it "shows the overall order with total price" do
      menu = Menu.new
      menu.load_menu('./data/menu.csv')
      dish_selected = menu.select_dish("Cottage Pie")
      order = FoodOrder.new
      order.order_dish(dish_selected, 2)
      expect(order.show_order).to eq "Dish: Cottage Pie, Qty: 2\nTotal Price: £16.00"
    end
  end

  # As a customer
  # So that I am reassured that my order will be delivered on time
  # I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

  # DO NOT FORGET TO SET YOUR ENVIRONMENT VARIABLES IN YOUR
  # .env file which should be sitting in the project root
  describe "User Story 4 - Send a real text" do
    xit "sends a text on order confirmation" do
      order = FoodOrder.new
      credentials = Credentials.new
      sms_provider = TwilioSMS.new(credentials)

      from_phone_number = ENV['FROM_TELEPHONE_NO']
      to_phone_number = ENV['TO_TELEPHONE_NO']
      message = "Thank you! Your order was placed and will be delivered before 18:52"

      sms = Messaging.new(sms_provider, from_phone_number, to_phone_number, message)
      expect { order.confirm_order(sms) }.not_to raise_error
    end
  end

  # As a customer
  # I want to order my meal from my phone
  # I would like place an order via SMS
  # describe "User Story 5 - Place order by text" do
  #   xit "starts an order server" do
  #     order_manager = OrderManager.new(Menu, Order, Dish)
  
  #     expect { order_server = OrderServerModule::OrderServer.new }.not_to raise_error
  #   end

  #   # CANNOT GET THIS TO WORK YET!
  #   xit "Takeaway creates an order from an incoming message" do
  #     #MyModule::Server.run!
  #     order_manager = OrderManager.new(Menu, Order, Dish)
  #     order_server = OrderServer.new
  #     OrderServerModule::OrderServer.run!
 
  #     p "Order Manager: #{order_manager}"
  #     loop do
  #       break unless order_manager.order_history.empty?
  #     end

  #     expect(order_manager.order_history.last.show_order).to eq"Dish: Spagbol, Qty: 2\nDish: Cottage Pie, Qty: 1\nTotal Price: £23.00"

  #   end
  # end

end
