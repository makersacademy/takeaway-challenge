class Order

  attr_reader :dishes, :total_cost, :total_prep_time

  def initialize
    @dishes = []
    @total_cost = 0
    @total_prep_time = 0
  end

  def add_dish(dish)
    @dishes << dish.name
    @total_cost += dish.price
    @total_prep_time += dish.prep_time
  end

  def remove_dish(dish)
    raise "There are no dishes in your order." if @dishes.length == 0
    @dishes.delete_at(@dishes.index(dish.name))
    @total_cost -= dish.price
    @total_prep_time -= dish.prep_time
  end

end