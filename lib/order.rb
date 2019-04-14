require_relative 'dish.rb'

class Order

  attr_reader :basket, :total

  def initialize
    @basket = {}
    @total = 0
  end

  def print
    dishes = Dish.new
    dishes.menu.map { |key, value| "#{key}: #{value}" }.each do |dish|
      return dish
    end
  end

  def select(dish)
    dishes = Dish.new
    raise "Dish not available!" unless dishes.on_the_menu?(dish)
    @basket[dish.to_sym] = dishes.menu[dish.to_sym]
    print
  end

  def print_order
    "Your order is: #{@basket.map { |key, value| "#{key}: #{value}" }} and the total is #{@total} pounds"
  end

end
