require_relative 'available_dishes'
require_relative 'dish'

class ShoppingCart

  attr_accessor :cart_contents
  attr_reader :available_dishes

  def initialize(available_dishes, cart_contents = [])
    @cart_contents = cart_contents
    @available_dishes = available_dishes
  end

  def add_dish(dish_user_input)
    array_object = find_user_input_in_available_dishes(dish_user_input)
    raise "Sorry, #{dish_user_input} is not available" if array_object.nil?
  end

  # private 

  def find_user_input_in_available_dishes(dish_user_input)
    @available_dishes.array_of_dishes.find { |dish| dish.name == dish_user_input }
  end

end