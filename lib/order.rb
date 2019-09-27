require_relative 'menu'

class Order
  attr_reader :current_order

  def initialize
    @current_order = []
    menu = Menu.new
  end

  def show_menu
    menu.print_menu
  end

  def choose(item, amount)
    order_hash = { item.to_sym => amount.to_i }
    @current_order << order_hash
  end

end
