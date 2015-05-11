require_relative 'order'
require_relative 'menu'
require_relative 'message_handler'

class Takeaway
  attr_accessor :menu_obj, :order_obj, :main_menu, :current_order, :message_handler
  def initialize (menuClass, orderClass, message_handlerClass)
    @menu_obj = menuClass.new
    @order_obj = orderClass.new
    @message_handler = message_handlerClass.new

    @main_menu = menu_obj.menu
    @current_order = order_obj.orders
  end

  def show_menu
    menu_obj.format_menu
  end

  def add_to_main_menu item, price
    menu_obj.add_dish item, price
  end

  def take_order item, quantity = 1
    quantity.times do
      current_order << main_menu.select {|dish, price| dish == item }
    end
  end

  def check_order
    puts "You have ordered..."
    item_num = 1
    current_order.each do |dish, price|
      dish.each do |k,v|
        puts "Item#{item_num}: #{k} that costs £#{v}"
        item_num += 1
      end
    end
    order_obj.order_calculation
    puts "Therefore the total cost of the order is £#{@order_obj.order_cost}"
  end

  def remove_order_item item_num
    current_order.delete_at(item_num-1)
  end

  def confirm_order
    fail "No items in basket" if order_obj.order_empty?
    message_handler.send_order_message
  end

  def deliver_order
    order_obj.delivered = true
    message_handler.send_delivery_message
    puts "You should have received a text from us letting you know your food has arrived" if order_obj.delivered?
  end
end


