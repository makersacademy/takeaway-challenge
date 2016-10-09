require_relative 'menu'

class Order
  attr_reader :sum, :basket, :menu

  def initialize(order_menu)
    @menu = order_menu.list
    @basket = Hash.new(0)
    @sum = 0
  end

  def add(dish, quantity)
    if @menu.has_key?(dish.to_sym)
      basket[dish.to_sym] += quantity
      "#{quantity} x #{dish} added to basket"
    else
      "Sorry, #{dish} is not on our menu"
    end
  end

  def print_order
    basket.each do | dish, quantity |
      puts "#{dish} x #{quantity}".ljust(25) + "£#{quantity * menu[dish]}".rjust(25)
    end

    puts "Total sum".ljust(25) + "£#{calculate_sum}".rjust(25)
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
