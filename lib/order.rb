# order class
class Order

  attr_reader :dish_list

  def initialize(dish_class)
    @dish_class = dish_class # no .new here as no new dishes
    @dish_list = [] # array for storing dishes in
    @total_cost = 0
  end

  def add_dish(dish)
    @dish_list << dish # push dish object to list
  end

  def remove_dish(dish)
    dish_list.each do |i| 
      if i.name == dish.name then @dish_list.delete(i) end
    end
  end

  def total_cost
    @dish_list.map { |i| i.price }.inject(:+)
  end

  def place_order

  end

end
