require 'dotenv'
require_relative 'menu'
require_relative 'send_sms'
require_relative 'fake_sms'
Dotenv.load('sensitive.env')

class Order
  attr_reader :menu, :basket

  def initialize(menu)
    @menu = menu.items
    @basket = Hash.new(0)
  end

  def show_menu
    @menu.each { |food, price| puts "#{food.capitalize}: £#{price}" }
  end

  def order(item, quantity = 1)
    raise "Item not in menu, please try again" unless @menu.include?(item.to_sym)

    @basket[item.downcase.to_sym] += quantity
  end

  def print_basket
    @total = 0
    @basket.each { |item, q| 
      @total += (@menu[item] * q) 
      puts "#{item.capitalize} x #{q}: £#{@menu[item] * q}" 
    }
    puts "Total: £#{@total}"
    price_error
  end

  def send_sms(sid, token, outbound, inbound, sms = SendSMS)
    sms = sms.new(sid, token, outbound, inbound)
    sms.send(@total)
  end

private

  def price_error
    raise "Totals do not match" if @basket.sum { |item, q| @menu[item] * q } != @total

    puts "Total is correct"
  end

end
