require_relative 'menu'

class OrderManager

  def initialize
    @menu = Menu.new
    @order = []
  end

  def show_menu
    @menu.show_dishes
  end

  def select(dishes)
    dishes.each do |dish, quantity|
    order.add(dish, quantity)
    end
  end

end
