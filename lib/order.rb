require_relative 'menu'

class Order
  attr_reader :basket, :menu

  def initialize(basket = {}, menu = Menu.new)
    @basket = basket
    @menu = menu
    @total = 0
  end

  def add_dish(dish, quantity)
    dish = dish.capitalize
    fail "That dish is not on the menu" if !@menu.dishes.key?(dish)
    @basket.store(dish, quantity)
  end

  def total
    @menu.dishes.each do |dish, price|
      if @basket.key?(dish)
        @total += (@basket[dish] * price)
      end
    end
    @total
  end

end
