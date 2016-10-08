require_relative 'menu'

class Order
  attr_reader :menu, :dishes, :quantity, :sum, :basket

  def initialize(order_menu)
    @menu = order_menu.list
    @basket = {}
    @sum = 0
  end

  def add(dish, quantity)
    if basket.has_key?(dish.to_sym)
      basket[dish.to_sym] = basket[dish.to_sym] + 1
    else
      basket[dish.to_sym] = quantity
    end
  end

  def print_order
    basket.each do | dish, quantity |
      puts "#{dish} x #{quantity} = £#{quantity * menu[dish]}"
    end
      puts "Total sum = £#{calculate_sum}"
  end

  private

  def calculate_sum
    basket.each do | dish, quantity |
      @sum += menu[dish] * quantity
    end
    sum
  end
end
