require './lib/dish.rb'
require './lib/menu.rb'

require 'twilio-ruby'
require 'time'
require 'dotenv'

Dotenv.load

class Order

  attr_reader :items

  def initialize(items = [])
    @items = items
    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def add(dish)
    @items << dish
  end

  def check
    items.length
  end

  def place_order
    @client.messages.create(
      from: '+441133205194',
      to: '+447719198784',
      body: confirmation_message
    )
  end

  private

  def confirmation_message
    current_time = Time.new
    time_stamp = current_time.strftime("%H:%M")
    message = "Thank you! Your order was placed at #{time_stamp} and will be delivered in half an hour."
  end

end
