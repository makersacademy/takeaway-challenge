require_relative 'meal'
require_relative 'text'

class Order
  attr_reader :dishes

  def initialize
    @meal = Meal.new(self)
    @text = Text.new
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
    @text.send_message(@meal.total_price)
  end

end
