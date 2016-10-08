require_relative 'menu'

class Order
  attr_reader :sum, :basket, :menu

  def initialize(order_menu)
    @menu = order_menu.list
    @basket = Hash.new(0)
    @sum = 0
  end

  def add(dish, quantity)
      basket[dish.to_sym] += quantity
  end

  def print_order
    basket.each do | dish, quantity |
      puts "#{dish} x #{quantity} = £#{quantity * menu[dish]}"
    end
    puts "Total sum = £#{calculate_sum}"
  end

  private

  attr_reader :dishes, :quantity

  def calculate_sum
    basket.each do | dish, quantity |
      @sum += menu[dish] * quantity
    end
    sum
  end
end
