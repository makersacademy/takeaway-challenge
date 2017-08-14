require './lib/takeout'

class Menu

  attr_reader :dishes

  def initialize
    @dishes = { :lasagna => 10,
                :pizza => 12,
                :burger => 10,
                :chips => 2 }
  end

  def add_to_menu(dish, price)
    @dishes[dish.downcase.to_sym] = price
  end

end
