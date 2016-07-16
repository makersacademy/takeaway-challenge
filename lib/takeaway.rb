require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :ordertotal, :current_order

  def initialize
    @ordertotal = 0
    @current_order = []
  end

  def menu
    menu = Menu.new.menu
  end

  def order(food)
    new_order = Order.new(food)
    @current_order.push(food)
    @ordertotal += menu[food]
  end

  def complete
    "#{@current_order}, #{@ordertotal}"
  end
end
