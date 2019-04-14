require_relative 'no_item_error'

class Selection
  
  attr_reader :dishes

  def initialize(menu)
    @dishes = {}
    @menu = menu 
  end


  def add(dish, number_of_dish)
    fail NoItemError, "#{dish.capitalize} are not on the menu, you pig." unless menu.has_dish?(dish)
    dishes[dish] = number_of_dish
  end

  def has_dish?

  end

  private 

  attr_reader :menu
end


