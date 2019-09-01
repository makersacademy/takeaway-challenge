require 'menu'

class Order

  ERROR_DISH = "Dish is not available, please order from the menu"

  attr_reader :my_basket, :time, :total, :menu

  def initialize(menu: Menu.new, time: Time.new)
    @menu = menu
    @my_basket = {}
    @my_basket.default = 0 #usefull to avoid nill class in first call of basket
    @time = time
    @total = 0
  end

  def add_item(dish, quantity)
    fail ERROR_DISH unless @menu.dishes.include?(dish)

    @my_basket[dish] += quantity
    puts "#{quantity}x #{dish.name}(s) added to your basket"
  end

end
