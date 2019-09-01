require 'menu'
require 'sms'

class Order

  ERROR_DISH = "Dish is not available, please order from the menu"

  attr_reader :my_basket, :time, :total, :menu, :sms

  def initialize(menu: Menu.new, time: Time.new, sms: Sms.new)
    @menu = menu
    @my_basket = {}
    @my_basket.default = 0 #usefull to avoid nill class in first call of basket
    @sms = sms
  end

  def add_item(dish, quantity)
    fail ERROR_DISH unless @menu.dishes.include?(dish)

    @my_basket[dish] += quantity
    puts "---"
    puts "#{quantity}x #{dish.name}(s) added to your basket"
    puts "---"
  end

  def view_basket
    orders = []
    @my_basket.each { |dish, quantity|
      orders << "#{dish.name} x#{quantity} = £#{dish.price * quantity}"
    }
    puts "--- your current basket ---"
    puts orders.join(", ")
  end


  def total
    order_total = 0
    @my_basket.each { |dish, quantity|
      order_total += dish.price * quantity
    }

    puts " \n Total = £#{order_total} \n"
    return order_total
  end

  def checkout(phone)
    puts "---"
    view_basket
    puts "---"
    total
    @sms.send(phone, "Your delivery estimate is #{Time.new + 3600}")
  end
end
