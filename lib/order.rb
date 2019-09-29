require_relative 'menu'

class Order
  attr_reader :current_order, :menu, :priced_order

  def initialize
    @current_order = {}
    @menu = Menu.new
  end

  def choose(item, amount)
    @current_order.store(item.to_sym, amount.to_i)
  end

  def show_menu
    add_price
  end

private


end
