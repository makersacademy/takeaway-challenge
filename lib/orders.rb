require_relative 'menu'

class Orders

  attr_reader :order

  def initialize
    @order = []
  end

  def add_dish(dish)
    menu1 = Menu.new
    new_order = menu1.menu
    @orders << new_order
  end

end
