#Understands a customers order
require_relative 'menu'
require_relative 'sms'


class Restaurant

  attr_reader :basket, :total, :sms

  def initialize(menu = Menu.new, sms = Sms.new)
    @menu = menu
    @basket = {}
    @total = 0
    @sms = sms
  end

  def print_menu
    puts
    puts " --- Welcome to Mr Shakes---".center(25)
    puts
    puts "Please choose from our menu:".center(25)
    puts
    @menu.dishes.each do |dish, price|
      puts "#{dish.ljust(10)} £#{price}".rjust(20)
    end
  end

  def add_order(item, quantity=1)
    @menu.dish_on_menu(item)
    @basket[item] = quantity
    @total += @menu.price(item)*quantity
  end

  def check_order
    puts "Here's a summary of your order:".center(25)
    basket.each do |dish, quantity|
      puts "#{quantity}x #{dish.ljust(10)} (£#{@menu.price(dish)*quantity})"
    end
    puts "Total: £#{@total}"
    end

  def complete_order
    time = Time.new
    add_hour = time + 1*60*60
    delivery_time = add_hour.strftime("%H:%M")
    @sms.send_confirmation_sms(delivery_time)
  end
end
