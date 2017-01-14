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

  def select_dishes(*dishes, total)
    basket = Order.new
    assign_dishes(basket, dishes)
    fail "You've entered #{basket.check} dishes rather than the #{total} that you expected!" if total != basket.check
    basket
  end

  private

  def price_list
    @list.dup
  end

  def assign_dishes(order, dishes)
    dishes.each { |dish|
      list.each { |item| order.add(item) if item.name == dish }
    }
  end

end
