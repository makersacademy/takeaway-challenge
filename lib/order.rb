# tracks an Order
class Order
  attr_reader :dishes, :total

  def initialize
    @dishes = []
    @total = 0
    @complete = false
  end

  def add_dish(dish)
    @dishes << dish
    recalculate_total
  end

  def recalculate_total
    @total = 0
    @dishes.each do |dish|
      @total += dish.price
    end
  end

  def placed?
    @complete
  end

  def place
    @complete = true
  end
end
