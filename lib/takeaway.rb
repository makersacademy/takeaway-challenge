require_relative 'menu'
require_relative 'order'
require_relative 'text'
require 'twilio-ruby'

class Takeaway
attr_reader :menu, :customer_order

  def initialize(menu = Menu.new, customer_order = Order.new, text = Text.new)
    @menu = menu
    @customer_order = customer_order
    @text = text
  end

  def show_menu
    menu.dishes.each do |dish|
      puts "#{dish.name}, £#{dish.price}"
    end
  end

  def check_total
    "Your order will cost £#{customer_order.total_bill}"
  end

  def confirm_order
   text.send_text("Thanks! Your order has been placed, will cost £#{@customer_order.total_bill} and will be delivered by #{@customer_order.delivery_time}")
  end

end
