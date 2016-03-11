class Order

  attr_reader :dish_list

  def initialize
    @dish_list = []
  end

  def add_dish(dish)
    @dish_list << dish
  end

  def remove_dish(dish)
    message = "You did not add #{dish[:name]}!"
    raise message if @dish_list.none? {|item| item[:name] == dish[:name]}
    @dish_list.delete(dish)
  end

  def total
    price = 0
    @dish_list.each {|dish| price += dish[:amount]*dish[:price]}
    price
  end
end
