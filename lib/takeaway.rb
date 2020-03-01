require_relative './menu'
require_relative './message'
# inherits the view menu and other menu methods from the menu class
class Takeaway < Menu

  attr_reader :current_order, :menu

# injects new menu object and order object
  def initialize(menu = Menu.new, current_order = Order.new)
#assigns the menu instance's menu_items list to an instance variable of takeaway
    @menu_items = menu.menu_items
    @current_order = current_order
  end

# method is inherited by Order and used to add dished to current_orders list of items
  def add(dish, amount)
    raise "Dish is not available" unless check(dish) == dish

    @current_order.add(dish, amount)
    puts "You have added #{amount} #{dish} to your order"
  end

# method creates a new message instance and sends that message to the user
  def complete_order
    sms = Message.new
    sms.send
  end

=begin
The complete_order method is currently untested
It needs unit tests to be added and conditionals implemented so
the message is only send if the total of the items added to the order
matches the prices on the menu
=end

# this method checks to see if the dish exists on the menu and returns the dish
  def check(dish)
    menu_items.each do | item |
      if item.has_value?(dish)
        return dish
      end
    end
  end
end
