require_relative 'dish'

class Restaurant
  attr_reader :dishes

  def initialize
    @dishes = []
  end

  def create_dish(name,price,dish = Dish)
    @dishes << dish.new(name, price)
  end

  def availabilty_checker
    @dishes.delete_if do |dish|
      dish.remaining_portions == 0
    end
  end

  def hold_portion_of_requested_dish(dish_name)
    raise "Dish Unavailable" unless valid_dish_choice?(dish_name)
    @dishes.each do |dish|

      if dish.name == dish_name
        raise "No Longer Available" if dish.remaining_portions == 0
        dish.remove_portion
        return {dish.name.to_sym => dish.price}
      end
    end
  end

private

  def valid_dish_choice?(dish_name)
    @name_checker = []
    @dishes.each do |dish|
      @name_checker << dish.name
    end
    @name_checker.include?(dish_name)
  end






end
