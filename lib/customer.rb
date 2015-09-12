require_relative 'menu'
require_relative 'order'

class Customer

  attr_reader :menu, :my_order

  def initialize
    @menu = Menu.new
    @my_order = Order.new
  end

  def display_menu
     @menu.each { |key, value| "#{key}, £#{value}" }
   end

  def select_dish(dish, quantity)
      fail 'Dish not on menu' unless menu.menu.has_key?(dish)
      my_order.order << {dish => quantity}
  end
end
