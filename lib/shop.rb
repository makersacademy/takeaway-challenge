require_relative 'menu'
class Shop
  attr_reader :order
  def initialize (menu = Menu)
  @order = Hash.new{0}
  @checkout = 0
  end

  def checkout
    @checkout
  end

  def add (dish, quantity)
    @order[dish]= quantity
    @order
  end

  def remove(dish)
    @order.delete(dish)
  end

  def show_menu(menu)
    @menu = menu
  end

end
