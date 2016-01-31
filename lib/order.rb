require_relative 'menu'

class Order

  attr_reader :menu_list, :add, :basket, :dish

MENU_LIST = Menu::MENU_LIST

  def initialize
    @menu_list = MENU_LIST
    @basket = {}
  end

  def add(dish)
    price = menu_list[dish]
    @basket[dish] = price
  end

end
