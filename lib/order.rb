require_relative 'menu'

class Order

  attr_reader :order

  def intialize
    @menu = Menu.new
    @order = []
  end

  def add_to_order(dish, quantity)
    @order << { dish: dish, quantity: quantity}
    p @order
  end

end