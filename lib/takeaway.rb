require_relative 'order'
require_relative 'menu'

class Takeaway
  def initialize(order=Order.new, menu = Menu.new)
    @order = order
    @menu = menu.italian_menu
  end

  def order
    @order
  end

  def menu
    @menu
  end

  def print_menu
    @italian_menu
  end

  def take_order
    puts 'What is your order?'

  end

  def add_to_list

  end

end
