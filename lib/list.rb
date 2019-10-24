require_relative 'dish'

class List

  attr_reader :dish_list

  def initialize
    @dish_list = Hash.new
  end

  def add_dish(dish)
    @dish_list.store(dish, dish.price)
  end

  def print
    p @dish_list
  end
end
