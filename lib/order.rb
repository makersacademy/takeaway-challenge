require 'menu'

class Order

  ERROR_DISH = "Dish is not available, please order from the menu"

  attr_reader :my_basket, :time, :total, :menu

  def initialize(menu: Menu.new, time: Time.new)
    @menu = menu
    @my_basket = {}
    @my_basket.default = 0 #usefull to avoid nill class in first call of basket
    @time = time
  end

  def add_item(dish, quantity)
    fail ERROR_DISH unless @menu.dishes.include?(dish)

    @my_basket[dish] += quantity
    puts "#{quantity}x #{dish.name}(s) added to your basket"
  end

  def view_basket
    orders = []
    @my_basket.each { |dish, quantity|
      orders << "#{dish.name} x#{quantity} = £#{dish.price * quantity}"
    }
    puts orders.join(", ")
  end


  def total
    order_total = 0
    @my_basket.each { |dish, quantity|
      order_total += dish.price * quantity
    }
    puts "Total = £#{order_total}"
    return order_total
  end

  def checkout
    puts "checkout"
  end
end
