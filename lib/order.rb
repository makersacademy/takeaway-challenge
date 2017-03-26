
class Order
  #stores the ordered dishes, can print a list of dishes ordered, and can calculate the total cost.
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def add_dish(dish)
    @dishes << dish
  end

  


end
