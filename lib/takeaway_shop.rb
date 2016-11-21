require "rubygems"  
require "twilio-ruby"
require_relative "order.rb"

class TakeawayShop

  attr_reader :menu, :customer

  def initialize()
  end

  def take_order( order )
    @customer = order
    @order_time = Time.now
  end

  def confirm_order
    order_details
  end

  def create_message
    "Thank you! Your order was placed and will be delivered before #{ @order_time.hour + 1 }:#{ @order_time.min }"
  end

private

  def order_details
    total_price = 0
    #items when order is more then 2, item when order is only one.
    @customer.order.size > 1 ? s = "s" : s = ""
    puts "You've orderd #{ @customer.order.size } item#{s}."
    puts "----------------------"

    #show items which the customer ordered
    (@customer.order).each do |item|
        puts "#{ item }  £#{ @menu[item] }"
        total_price += @menu[item]
    end
    "[ total: £#{ total_price } ]"
  end

end
