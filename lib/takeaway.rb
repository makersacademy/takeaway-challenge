require 'meal'

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

    # Check the wanted order numbers against the menu and create a meal.
    dishes.each do |wanted_dish|
      @menu.each do |menu_dish|
        if menu_dish.number == wanted_dish[0]
          menu_dish.quantity = wanted_dish[1]
          @meal.add menu_dish
        end
      end
    end

    fail 'You\'ve got the price wrong!' unless
      check_price(@meal, expected_total)

  true
  end

  private

  def check_price(meal, expected_total)
    meal.total == expected_total
  end

end