require_relative 'dish'

class Menu
  attr_reader :available_dishes

  def initialize
    @available_dishes = []
  end

  # add(dish_name, quantity = 1)
  def add_item(dish)
    available_dishes << dish
  end
  # print
  # remove(dish)
end