require_relative 'dish'

class List
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def print_list
    @dishes
  end

  def add(dish)
    @dishes << { :name => dish.name, :price => dish.price }
  end
end
