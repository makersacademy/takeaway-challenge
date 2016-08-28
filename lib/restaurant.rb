require_relative "menu.rb"
require_relative "order_log.rb"

class Restaurant
  def initialize(menu_class = Menu.new, order_log_class = OrderLog.new)
    @menu_class = menu_class
    @order_log_class = order_log_class
  end

  def start_order
    order_log_class.start_order
  end

  def show_menu
    menu_class.get_menu
  end

  def add_item(dish_id, quantity)
    fail "Please add a proper quantity" unless quantity_correct?(quantity)
    fail "Dish is not available" unless dish_available?(dish_id)
    order_log_class.add_item(show_menu[dish_id], quantity)
  end

  def order_summary
    order_log_class.order_summary
  end

  def total
    #receives an array of sums per product
    order_log_class.total.inject(:+)
  end

  def checkout(amount)
    order_log_class.checkout_order(amount)
  end

  private

  attr_reader :menu_class, :order_log_class

  def quantity_correct?(quantity)
    quantity.class == Fixnum && quantity > 0
  end

  def dish_available?(dish_id)
    show_menu.include?(dish_id)
  end
end
