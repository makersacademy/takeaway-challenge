require_relative './order_printer.rb'
require_relative './restaurant.rb'

class Order

  def initialize
    @choices = []
  end

  def add(dish, quantity = 1)
    @choices << {dish => quantity}
  end

  def get(index)
    all[index]
  end

  def summary(order_printer = OrderPrinter)
    order_printer.print(all)
  end

  def total_price
    individual_dish_totals.inject { |sum,num| sum + num}.round(2)
  end

  def place_order(user_price, restaurant = Restaurant)
   raise 'You have not confirmed the correct price' unless correct_price(user_price)

   restaurant.confirm_order(all)
  end

  private

  def all
    @choices
  end

  def single_dish_price(order_line)
    order_line.keys[0].price.to_f * order_line.values[0]
  end

  def individual_dish_totals
    all.map { |order_line| single_dish_price(order_line) }
  end

  def correct_price(user_price)
    user_price == total_price
  end

end