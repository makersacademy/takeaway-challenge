require_relative 'meal'
require_relative 'text'

class Order
  attr_reader :dishes

  def initialize(meal = Meal.new, text = Text.new)
    @meal = meal
    @text = text
    @dishes = []
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

  def complete_order(price)
    raise "Sorry, please confirm your order price" unless correct_amount?(price)
    @text.send_message(price)
  end

  def delete_meal
    @meal.delete_meal
    @dishes = []
  end

private

  def correct_amount?(price)
    @meal.total_price == price
  end
end
