require_relative "menu"
require_relative "order"
require_relative "sms"
require 'dotenv'
Dotenv.load

class Takeaway
  attr_reader :basket, :menu, :order, :sms

  def initialize(order = Order.new, sms = SMS.new)
    @basket = order.basket
    @menu = order.menu
    @order = order
    @sms = sms
  end

  def see_menu
    @menu.each do |item, price|
      puts "#{item}, £#{price}"
    end
  end


  def add_to_basket(item, number = 1)
    self.order.add_to_basket(item, number)
  end

  def show_basket
    self.basket
  end

  def show_price
    "£#{self.order.grand_total}"
  end

  def checkout(amount)
    self.order.checkout(amount)
    send_confirmation
  end

  private
  def send_confirmation
    sms.send_confirmation
  end

end
