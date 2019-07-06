require_relative './menu.rb'


class Order

  attr_reader :basket, :menu, :total_cost

  def initialize (menu = Menu)
    @basket = []
    @menu = menu.new
    @total_cost = 0
  end

  def make_order(dish, quantity = 1)
    fail "Sorry, that dish is not available" if dish_unavailable(dish)
    @total_cost += @menu.cost(dish, quantity)
    @basket << {dish.to_sym => quantity}
  end

  def check_order
    order_calculator
  end

  private

  def dish_unavailable(dish)
    @menu.dish_available?(dish) == false
  end

  def order_calculator
    list = []
    @basket.each do |items|
      items.each do |key, value|
        list << "#{key} x #{value} "
      end
    end
    list.join + "Total: £#{total_cost}"
  end

end
