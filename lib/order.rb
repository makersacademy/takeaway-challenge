require_relative 'meal'
require_relative 'text'

class Order
  attr_reader :basket

  def initialize(meal = Meal.new, text = Text.new)
    @meal = meal
    @text = text
    @basket = []
  end

  def view_dishes(restaurant)
    restaurant.display
  end

  def select_dishes(restaurant, *dishes)
    @basket = @meal.select_dishes(restaurant, *dishes)
  end

  def price
    @meal.total_price
  end

  def checkout(price)
    raise "Sorry, please confirm your order price" unless correct_amount?(price)
    send_text(price)
  end

  def send_text(price)
    @text.send_message(price)
  end


  def delete_meal
    @meal.delete_meal
    @basket = []
  end

private

  def correct_amount?(price)
    @meal.total_price == price
  end
end
