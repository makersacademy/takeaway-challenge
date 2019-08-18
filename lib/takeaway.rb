require 'dotenv/load'
require './lib/menu'
require './lib/send_sms'

class Takeaway
  include Sms
  attr_reader :menu, :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = {}
    @total = 0
  end

  def view_menu
    @menu.display
  end

  def add(dish, quantity = 1)
    error_message = "#{dish} is not available, please order from the menu"
    raise error_message unless @menu.menu.include?(dish)

    @basket[dish] = quantity
    puts "#{quantity}x #{dish}(s) added to your basket"
  end

  def view_basket
    orders = []
    @basket.each do |dish, quantity|
      price = @menu.menu[dish]
      orders << "#{dish} x#{quantity} = £#{price * quantity}"
    end
    puts orders.join(", ")
  end

  def total
    @basket.each do |dish, quantity|
      price = @menu.menu[dish]
      @total += price * quantity
    end
    puts "Total = £#{@total}"
  end

  def checkout
    d_time = (Time.now + 60 * 60).strftime("%H:%M")
    msg = "Thank you! Your order was placed and will be delivered by #{d_time}"
    send_sms(msg)
  end
end
