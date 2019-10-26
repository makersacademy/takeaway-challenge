require_relative 'dish'

class Restaurant
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def create_dish(name,price,dish = Dish)
    @dishes << dish.new(name, price)
  end

end
