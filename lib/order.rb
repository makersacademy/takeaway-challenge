class Order

  attr_reader :dish_list

  def initialize
    @dish_list = []
  end

  def add_dish(dish)
    @dish_list << dish
  end

  def remove_dish(dish)
    @dish_list.delete(dish)
  end

  def total
    price = 0
    @dish_list.each {|dish| price += dish[:amount]*dish[:price]}
    price
  end
end
