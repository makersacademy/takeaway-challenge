require './lib/dish.rb'
require './lib/order.rb'

class Menu

  attr_reader :list

  def initialize
    @list = [
      Dish.new('Margherita Pizza', 8.45),
      Dish.new('Spaghetti Carbonara', 10.75),
      Dish.new('Calzone', 12.45),
      Dish.new('Spaghetti Bolognese', 9.95),
      Dish.new('Caprese Salad', 4.35)
    ]
  end

  def see_dishes
    price_list.map { |item| "#{item.name} (£#{item.price})"}.join("; ")
  end

  def select_dishes(*dishes)
    basket = Order.new
    dishes.each { |dish|
      list.each { |item|
        basket.add(item) if item.name == dish
      }
    }
    basket
  end

  private

  def price_list
    @list.dup
  end

end
