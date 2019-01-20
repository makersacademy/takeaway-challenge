require_relative 'menu'

class Restaurant
  attr_reader :menu
  attr_accessor :current_order
  def initialize(menu = Menu.new, current_order = Order.new)
    @menu = menu
    @current_order = current_order
  end

  def display_menu
    p @menu.menu_items
  end

  def order(item, quantity = 1)
      @current_order.add(item, quantity)
  end

end


class Order
  attr_accessor :items

  def initialize
    @items = Array.new
  end

  def add(item, quantity)
    @items << [item, quantity]
  end

end
