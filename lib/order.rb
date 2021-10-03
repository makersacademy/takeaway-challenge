require "dish_list"

class Order
  attr_reader :current_order

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

  private

  def price(dish_name)
    return Restaurant::MENU[dish_name]
  end

  def store_dish(dish_name, dish_price)
    @current_order << [dish_name, dish_price]
  end
end
