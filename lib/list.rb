class List
  
  attr_reader :dish_list
  def initialize
    @dish_list = Hash.new
  end

  def add_dish(dish, price)
    @dish_list[dish] = price
  end

end
