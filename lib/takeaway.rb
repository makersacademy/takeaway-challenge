require 'menu'
require 'order'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def add_to_order(dish)
    order.add(dish)
  end
  
  def show_menu
    food = ""
    menu.dishes.each do |dish|
      food.concat("#{dish.name}, #{dish.price}")
    end
    food
  end

end
