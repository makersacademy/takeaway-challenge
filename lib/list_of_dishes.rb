require_relative 'dishes'

class ListOfDishes

  attr_reader :menu

  def initialize
    @menu = []
  end

  def add_dish(*dishes)
    dishes.each do |dish|
      @menu.push(dish)
    end
  end

  def list_by_dish_numbers(*dish_numbers)
    dish_numbers.each do |dish_number|
      puts "Order #{dish_number}. " +
      "#{@menu[dish_number - 1].name}: £#{@menu[dish_number - 1].price}"
    end
  end

end
