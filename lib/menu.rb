
require_relative 'dish'

class Menu
  attr_reader :list

  def initialize()
    @list = []
    @selected_dishes = Hash.new(0)
  end

  def read_menu
    @list
  end

  def select(dish,quantity = 1)
    @selected_dishes[dish] += quantity
    return @selected_dishes
  end

  def add(dish)
    (@list.include?(dish))? @list : @list << dish 
  end

end
