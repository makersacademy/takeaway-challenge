require_relative './order.rb'
require_relative './menu.rb'
require_relative './printer.rb'
require_relative './messager.rb'

class InvalidOptionError < StandardError; end

class Restaurant

  attr_reader :current_order

  def initialize(menu = Menu.new, order = Order.new, printer = Printer.new, name = "Woahaca")
    @menu = menu
    @current_order = order
    @print = printer
    @print.welcome_message(name)
  end

  def view_menu
    @menu.show_menu
  end

  def add_order(item_number, quantity = 1)
    raise(InvalidOptionError) unless on_menu?(item_number)
    @current_order.add_dish(dish(item_number), quantity)
  end

  def remove_order(item_number, quantity = 1)
    @current_order.remove_dish(dish(item_number),quantity)
  end

  def order_summary
    @current_order.review_order
  end

  def checkout
    @current_order.confirm_order
    @print.receipt(order_summary,@current_order.order_total)
  end

  private

  def on_menu?(menu_number)
    return true if menu_number =~ /^[0-9]+$/
    return true unless menu_number.to_i > @menu.dishes.length
  end

  def dish(item_number)
    @menu.dishes[item_number - 1]
  end
end
