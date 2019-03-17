require 'menu'

class Order

attr_reader :dishes, :menu
  def initialize(menu)
    @dishes = {}
    @menu = menu
  end 

  def add(dish, quantity)

    fail "item is not on the menu" unless menu.has_dish?(dish)
    dishes[dish] = quantity

  end



end 