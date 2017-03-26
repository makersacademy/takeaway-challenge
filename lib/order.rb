
class Order
  #stores the ordered dishes, and can calculate the total cost.
  attr_reader :dishes, :total

  def initialize
    @dishes = []
    @total = 0
  end

  def add_dish(dish)
    @dishes << dish
    self.total += dish.price
  end

  private

  attr_writer :total



end
