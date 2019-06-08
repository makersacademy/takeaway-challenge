require_relative './order_printer.rb'
require_relative './restaurant.rb'

class Order

  def initialize(menu)
    @menu = menu
    @choices = {}
  end

  def add(dish_name, quantity = 1)
    @choices[get_dish(dish_name)] = quantity
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

  def get_dish(dish_name)
    @menu.get_dish_by_name(dish_name)
  end

  def single_dish_price(dish, quantity)
    dish.price.to_f * quantity
  end

  def individual_dish_totals
    all.map { |dish, quantity| single_dish_price(dish, quantity) }
  end

  def correct_price(user_price)
    user_price == total_price
  end

end