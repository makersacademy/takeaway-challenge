require_relative './order.rb'
require_relative './menu.rb'
require_relative './display.rb'
require_relative './messager.rb'

class Restaurant
  include Display

  attr_reader :current_order

  def initialize(menu = Menu.new, order = Order.new, messager = Messager.new, name = "Woahaca")
    @menu = menu
    @current_order = order
    @messager = messager
    welcome_message(name)
  end

  def view_menu
    @menu.show_menu
  end

  def add_order(menu_number,quantity = 1)
    raise("Not on menu") unless on_menu?(menu_number)
    dish = @menu.dishes[menu_number - 1]
    @current_order.add_dish(dish,quantity)
  end

  def remove_order(dish,quantity = 1)
    @current_order.remove_dish(dish,quantity)
  end

  def order_summary
    @current_order.review_order
  end

  def checkout
    @messager.send_confirmation(@current_order.order_total)
  end

  private

  def on_menu?(menu_number)
    return true if menu_number =~ /^[0-9]+$/
    return true unless menu_number.to_i > @menu.dishes.length
  end


end
