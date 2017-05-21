require 'dotenv/load'
Dotenv.load('settings.env')
require_relative 'notifier'
require_relative 'menu'
require_relative 'order'

class Restaurant

  attr_reader :name, :address, :menu, :orders, :current_order, :next_order_id

  def initialize(name, address, menu = Menu.new, notifier = Notifier.new)
    @name = name
    @address = address
    @notifier = notifier
    @menu = menu
    @orders = []
    @next_order_id = (orders.count) + 1
  end
 
  def create_customer_order
    @current_order = Order.new(@menu)
  end

  def finalize_customer_order
    @current_order.finalize(@next_order_id)
    @orders << @current_order
  end

  def accept_customer_order(order_id)
    get_order_details(order_id) 
    @notifier.send_message("Your order #{order_id} was accepted")
  end

  def get_order_details(order_id)
    @orders.each_with_index do |order, index|
      return @current_order = order if order_id == order.id
    end
    raise "Invalid order"
  end

end

# KFC = Restaurant.new("KFC","Chingford")
# KFC.menu.create_dish("Chicken Burguer", "Spicy", 8)
# KFC.create_customer_order
# KFC.current_order.add_dish("Chicken Burguer", 1)
# KFC.finalize_customer_order
# KFC.accept_customer_order(1)

