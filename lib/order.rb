require './lib/menu.rb'

class Order

  attr_reader :basket

  def initialize(menu)
    @basket = []
    @menu = menu
  end

  def select_dish(dish_num, quantity)
    @basket << { dish: @menu.dishes[dish_num - 1][:dish],
      total: @menu.dishes[dish_num - 1][:price] * quantity }
  end

  def check_total
    sum = 0
    @basket.each do |hash|
      sum += hash[:total]
    end
    sum
  end

  def place_order(amount)
    raise "Amount not correct" if amount != check_total
  end
end
