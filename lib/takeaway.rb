require_relative 'dish'
require_relative 'order'
require 'twilio-ruby'
require 'dotenv/load'

class Takeaway 
  attr_reader :menu
  attr_accessor :order
    
  def initialize
    @menu = [Dish.new("Pizza", 10), Dish.new("Kebab", 5), Dish.new("Chips", 2)]
  end

  def add(dish)
    @menu << dish
  end
  
  def show_menu
    @menu
  end

  def new_order
    @order = Order.new
  end

  def complete_order
    send_text("Thank you! Your order was placed and will be delivered before #{Time.now + 1 * 60 * 60}")
  end

  private

  def send_text(message)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV['TAKEAWAY_NUMBER'] # Your Twilio number
    to = ENV['MY_NUMBER'] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: message
    )
  end
end
