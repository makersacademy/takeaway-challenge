require_relative './menu'
require_relative './message'
# inherits the view menu and other menu methods from the menu class
class Takeaway < Menu

  attr_reader :current_order, :menu_items

# injects new menu object and order object
  def initialize(menu = Menu.new, current_order = Order.new)
# assigns the menu instance's menu_items list to an instance variable of takeaway
    @menu_items = menu.menu_items
    @current_order = current_order
  end

# method is inherited by Order and used to add dishes to current_orders list of items
  def add(dish, amount)
    raise "Dish is not available" unless check(dish) == dish

    @current_order.add(dish, amount)
    puts "You have added #{amount} #{dish} to your order"
  end

# checks the order has an item sends a message to the user
  def complete_order
      raise "You don't have any items in your basket" if @current_order.order_items.empty?

      send_message
  end

# checks the total for the order
  def check_total
    @current_order.check_total
    puts "Your current order comes to £#{@current_order.current_total}"
  end

private

# this method checks if the dish is on the menu and returns the dish
  def check(dish)
    @menu_items.each do | item |
      if item.has_value?(dish)
        return dish
      end
    end
  end

# creates a new message instance and sends it to the user
  def send_message
    sms = Message.new
    sms.send
  end

end
