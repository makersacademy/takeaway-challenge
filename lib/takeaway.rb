require_relative "menu"
require_relative "order"
require_relative "sms"

class Takeaway
  attr_accessor :menu, :order, :current_order

  def initialize(menu = Menu.new, order = Order, sms = SMS)
    @menu = menu
    @order = order
    @sms = sms
  end

  def show_menu
    print @menu.list
  end

  def add_to_order(dish)
    (@current_order = @order.new) unless @current_order
    fail "Sorry, this dish is not available" unless dish_exists?(dish)
    @current_order.add({ dish => @menu.dishes[dish].to_i })
  end

  def finalize_order(sms = @sms.new)
    @current_order = nil
    sms.send_sms
  end

  def dish_exists?(dish)
    @menu.dishes.has_key?(dish)
  end
end

# sample = "Beef Burger, 5, Chicken Burger, 4, Slice of Pizza, 4, Chips, 2.50"
# takeaway = Takeaway.new
# takeaway.add_to_menu(sample)
# takeaway.show_menu
# takeaway.add_to_order("Beef Burger")
# takeaway.add_to_order("Chicken Burger")
# takeaway.add_to_order("Chips")
# takeaway.current_order.show_order
