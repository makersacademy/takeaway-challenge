require_relative 'menu'
require_relative 'order'

class Customer

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
    @phone_number = ENV['CUSTOMER_NUMBER']
  end

  def show_menu
    @menu.display
  end

  def show_order
    @order.display
  end

  def select_dish(dish, quantity)
    @order.add(dish, quantity)
  end

  def place_order
    @order.confirmed(@phone_number)
  end

end
