require_relative 'menu'
require_relative 'order'
require_relative 'sms'
require 'dotenv'
Dotenv.load

class Takeaway
  attr_reader :order

  def initialize(menu)
    @menu = menu
    @order = nil
    @payment_total = 0
  end

  def view_menu
    @menu.print_menu
  end

   def create_order
     @order = Order.new
   end

   def place_order
     raise "Please create an order first" if @order == nil || @order.basket == []
     sum_basket
     raise "Please re-calculate order total" if !check_order_total?
     send_text("Thank you! Your order was placed and will be delivered before " + (Time.now + 3600).strftime("%R"))
   end

private

  def check_order_total?
    @payment_total == @order.basket_total
  end

  def sum_basket
    @order.basket.each do |entry|
      entry.each do |name, quantity|
      @payment_total += ((name.price) * quantity)
        end
      end
  end

  def send_text(message)
    sender = SMS.new
    sender.send_sms(message)
  end

end
