require_relative 'meal'

class Order
  attr_reader :dishes

  def initialize
    @meal = Meal.new(self)
  end

  def view_dishes(restaurant)
    restaurant.dishes
  end

  def select_dishes(restaurant, *dishes)
    @dishes = @meal.select_dishes(restaurant, *dishes)
  end

  def price
    @meal.total_price
  end

  # def verify_order
  # end

  def confirm
    exec("ruby ./lib/text.rb")
  end

end
