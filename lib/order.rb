require_relative 'meal'
require_relative 'text'

class Order
  attr_reader :dishes

  def initialize(meal = Meal.new, text = Text.new)
    @meal = meal
    @text = text
  end

  def view_dishes(restaurant)
    restaurant.display
  end

  def select_dishes(restaurant, *dishes)
    @dishes = @meal.select_dishes(restaurant, *dishes)
  end

  def price
    @meal.total_price
  end

  # def verify_order
  # end

  def complete_order(price)
    @text.send_message(price) if is_correct_amount?(price)
  end

private

  def is_correct_amount?(price)
    @meal.total_price == price
  end


end
