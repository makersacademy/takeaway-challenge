require_relative 'basket'
require 'dotenv/load'
require 'twilio-ruby'

class Order
  def initialize(basket = Basket.new)
    @basket = basket
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def show_order
    puts @basket.show
  end

  def add_item(item)
    @basket.add_item(item)
  end 
  
  def show_menu
    @basket.menu.print_menu
  end

  def place_order
    raise "Can't place an order with an empty basket!" if @basket.empty?

    @basket.clear
    send_sms
  end

  private
  def send_sms
    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['MY_NUMBER'],
      body: "Thanks! Your order will arrive no later than #{(Time.now + 3600).strftime("%k:%M")}."
    )
  end
end
