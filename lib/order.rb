require "dish_list"

class Order
  attr_reader :current_order, :time

  def initialize
    @current_order = []
  end

  def choose_dish(dish_name)
    dish_price = price(dish_name)
    store_dish(dish_name, dish_price)
  end

  def calculate_price
    total = 0
    @current_order.each do |_, price|
      total += price
    end
    total
  end

  def confirm_order
    time = (Time.now + 60 * 60).strftime("%H:%M")
    p "Thank you! Your order was placed and will be delivered before #{time}"
  end

  private

  def price(dish_name)
    return Restaurant::MENU[dish_name]
  end

  def store_dish(dish_name, dish_price)
    @current_order << [dish_name, dish_price]
  end
end
