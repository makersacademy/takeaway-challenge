require 'dish'

class Menu
  attr_reader :available_dishes

  def initialize
    @available_dishes = []
  end

  # add(dish_name, quantity = 1)
  # print
  # remove(dish)
end