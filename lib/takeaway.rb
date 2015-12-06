require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :menu

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.dishes
  end

  def view_order
    order_basket.each do | dish, quantity|
      puts "#{quantity}x #{dish.name}"
    end
  end

  def order(dish_name, quantity=1)
    dish = @menu.get_dish(dish_name)
    @order.add(dish, quantity)
  end

  private

  def order_basket
    @order.basket
  end

end
