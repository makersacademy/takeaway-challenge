require_relative 'menu.rb'

class Order
  attr_reader :basket
  def initialize(basket = {})
    @basket = basket
  end

  def add_dish(number, quantity = 1)
    dish_name = (Menu.new.dishes[number]).first
    dish_cost = (Menu.new.dishes[number].last)
    @basket[dish_name] = [dish_cost, quantity]
    @basket
  end

  def basket_summary(basket)
    basket.map { |name, cost| [name, cost[0] * cost[1]] }.to_h
  end

  def total_cost(summary)
    summary.values.inject(&:+)
  end

  def print_receipt(basket_summary,total_cost)
    details = basket_summary.map { |name, cost| "#{name}  #{cost/100.0}" }.join("\n")
    puts details
    puts "-----------------------"
    puts "Total:  £#{total_cost/100.0}"
  end

end
