require_relative 'dish'

class Basket
attr_reader :dishes
  def initialize
    @dishes = []
  end

  def add(dish)
    @dishes << dish
  end
end
