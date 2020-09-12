require_relative 'Menu'

class Order

  attr_accessor :dishes

  def initialize(menu = Menu.new, quantity = nil)
    @menu = menu
    @quantity = quantity
    @order_list = []
  end

  def add(dish)
    p @menu.dishes
  end
   
end