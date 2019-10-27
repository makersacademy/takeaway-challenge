require_relative 'dish'

class List

  attr_reader :dish_list, :checkout

  def initialize
    @dish_list = Hash.new
    @checkout = []
  end

  def add_dish(dish)
    @dish_list.store(dish, dish.price)
  end

  def print
    p @dish_list
  end

  def select(dish)
    @checkout << @dish_list.select { |k, _v| k == dish }
  end

  def checkout
    p @checkout
  end
end
