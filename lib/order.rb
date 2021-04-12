require_relative 'menu'

class Order

  attr_reader :menu, :selection

  def initialize(menu = Menu.new)
    @menu = menu
    @selection = {}
  end

  def add_to_order(dish, quantity)
    @selection[dish.to_sym] = quantity
  end

end