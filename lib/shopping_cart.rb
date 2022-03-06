require_relative 'available_dishes'
require_relative 'dish'

class ShoppingCart

  attr_accessor :cart_contents, :array_object
  attr_reader :available_dishes

  def initialize(available_dishes, cart_contents = [])
    @cart_contents = cart_contents
    @available_dishes = available_dishes
    @array_object = nil
  end

  def add_dish(dish_user_input)
    @array_object = find_user_input_in_available_dishes(dish_user_input)
    raise "Sorry, #{dish_user_input} is not available" if array_object.nil?
    @cart_contents << @array_object
  end

  def show_contents
    @cart_contents.map { |dish| "#{dish.name} - £#{dish.price}" }.join("\n") + "\nTOTAL - £#{total}"
  end

  private

  def total
    sum = 0
    @cart_contents.each do |dish|
      sum += dish.price
    end
    sum
  end

  def find_user_input_in_available_dishes(dish_user_input)
    @available_dishes.array_of_dishes.find { |dish| dish.name == dish_user_input }
  end

end
