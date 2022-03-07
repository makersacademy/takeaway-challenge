require_relative "dish"
require_relative "order"
class Dishes
  attr_reader :list

  def initialize(dish = [])
    @list = dish
  end

  def see_dishes
    @list.each do |hash|
      hash.each do |meal_number, dish|
        puts "#{meal_number} => #{dish.name}  £#{dish.price}"
      end
    end
    puts "Please use the numbers on the left to choose your dishes"
  end

  def select_dishes(selected_meal_numbers)
    @chosen_dishes = []
    dish_finder(selected_meal_numbers)
    @chosen_dishes
  end

  def create_order
    Order.new(@chosen_dishes)
  end


  private
  def dish_finder(selected_meal_numbers)
    selected_meal_numbers.each do |meal_number|
      @chosen_dishes.push(list[0][meal_number])
    end
  end

end 