require_relative 'meal'

# This class is initialised with Dishes to form a menu and can construct
# an instance of Meal from a given list of dishes.
class Takeaway

  def initialize(dish_klass)
    @menu = []
    @menu << dish_klass.new(44, 'Duck a la banana', 4.50, 0)
    @menu << dish_klass.new(10, 'Deep fried Mars bar', 0.10, 0)
    @menu << dish_klass.new(20, 'Birdseye potato waffles', 1.99, 0)
    @menu << dish_klass.new(69, 'Trio! Trio.', 1.50, 0)
  end

  def see
    list = ''
    @menu.each do |dish|
      list += dish.see
      list += ', '
    end
    list.chomp(', ')
  end

  def order(dishes, expected_total, meal_klass)
    @meal = meal_klass.new

    dishes.inject(@meal) do |meal, dish|
      meal.add get_dish_object(dish)
    end

    fail 'You\'ve got the price wrong!' unless
      @meal.total == expected_total

  true
  end

  private

  def get_dish_object(wanted_dish)
    @menu.select{|tested_dish| tested_dish.number == wanted_dish[0]}
  end

end