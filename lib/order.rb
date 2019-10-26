require './lib/menu.rb'

class Order

  attr_reader :basket

  def initialize
    @basket = []
  end

  def select_dish(dish_num, quantity)
    menu = Menu.new
    @basket << { dish: menu.dishes[dish_num-1][:dish], total: menu.dishes[dish_num-1][:price]*quantity }
  end

end
