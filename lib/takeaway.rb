require_relative 'order'
require 'twilio-ruby'
require 'sinatra'

class Takeaway
  attr_reader :menu

  def initialize
    @menu = {}
  end

  def add_dish_to_menu(dish, price)
    @menu[dish] = price
  end

  def display_menu
    @menu
  end

  def receive_order(*)
    t = Time.now + (0o1 * 60 * 60)
    # send text with message:
    "Thank you! Your order was placed and will be delivered before #{t.strftime("%I:%M %p")}"
  end

  # post '/sms-order_received' do
  #   twiml = Twilio::TwiML::MessagingResponse.new do |r|
  #     t = Time.now + (01*60*60).strftime("%I:%M %p")
  #     r.message(body: 'Thank you! Your order was placed and will be delivered before #{t}')
  #   end
  #   twiml.to_s
  # end
end
