require_relative 'menu.rb'
require_relative 'order.rb'
require 'dotenv'
require 'rubygems'
require 'twilio-ruby'

class TakeAway
  
  def initialize(order = Order.new)
    @order = order
    @env = Dotenv.load
  end
  
  def read_menu
    @order.menu
  end
  
  def complete_order(price)
    fail "Value does not match the total" unless correct_amount?(price)
    send_text("Thank you! Your order was placed.")
  end
  
  def order(dish, quantity = 1)
    add_dish_to_order(dish, quantity)
  end
  
  def basket_summary
    @order.current_order
  end
  
  def total
    "Total: £" + "%.2f" % @order.total_amount
  end
  
  private 
  
  def add_dish_to_order(dish, quantity)
    @order.add_dish_to_basket(dish, quantity)
  end
  
  def send_text(message)
    client = Twilio::REST::Client.new @env["account_sid"], @env["auth_token"]
    client.account.messages.create(
      from: @env["from_number"],
      to: @env["to_number"],
      body: message
    )
  end
  
  def correct_amount?(price)
    @order.total_amount == price
  end
end