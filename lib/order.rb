require_relative 'dish.rb'
require 'twilio-ruby'
require 'dotenv/load'

class Order

  attr_reader :basket, :total

  def initialize
    @basket = {}
    @total = 0
    @client = Twilio::REST::Client.new ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']
  end

  def select(dish)
    dishes = Dish.new
    raise "Dish not available!" unless dishes.on_the_menu?(dish)
    @basket[dish.to_sym] = dishes.menu[dish.to_sym]
    @total += dishes.menu[dish.to_sym]
    print
  end

  def print
    "Your order is: #{@basket.map { |key, value| "#{key}: #{value}" }} and the total is #{@total} pounds"
  end

  def send_text
    time = Time.now
    delivery_time = (time + 3600).strftime '%H:%M'
    @client.api.account.messages.create(
      from: '+441946372023',
      to:  ENV['PHONE'],
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

end
