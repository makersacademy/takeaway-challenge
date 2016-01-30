require_relative 'menu.rb'
require_relative 'order.rb'
require 'dotenv'
require 'rubygems'
require 'twilio-ruby'

class TakeAway
  
  def initialize(order = Order.new)
    @order = order
    @credentials = Dotenv.load
  end
  
  def read_menu
    @order.menu
  end
  
  def complete_order(price)
    raise "Value does not match the total" unless is_correct_amount?(price)
    send_text("Thank you! Your order was placed.")
  end
  
  def order(dish, quantity = 1)
    add_dish_to_order(dish, quantity)
  end
  
  def basket_summary
    @order.current_order
  end
  
  def total
    basket_summary
    "Total: £" + "%.2f" % @order.total_amount
  end
  
  private 
  
  def add_dish_to_order(dish, quantity)
    @order.add_dish_to_basket(dish, quantity)
  end
  
  def send_text(message)
    client = Twilio::REST::Client.new @credentials["account_sid"], @credentials["auth_token"]
    client.account.messages.create(
      :from => @credentials["from_number"],
      :to => @credentials["to_number"],
      :body => message
    )
  end
  
  def is_correct_amount?(price)
    @order.total_amount == price
  end
end