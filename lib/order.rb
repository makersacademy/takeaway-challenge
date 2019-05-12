require_relative 'menu'

class Order
  attr_reader :menu

  def initialize
    @menu = Menu.new
    @order_list = []
  end

  def add(dish, quantity)
    @order_list << { dish: dish, quantity: quantity }
    @order_list
  end

end
