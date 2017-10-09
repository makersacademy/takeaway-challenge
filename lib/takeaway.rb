
require 'rubygems'
require 'twilio-ruby'
require 'sinatra'

class Takeaway

  attr_reader :menu, :current_order, :total_confirmation

  def initialize
    @menu = Dishes.new
    @current_order = {}
  end

  def print_menu
    @menu.list
  end

  def select(dish, quantity = 1)
    @current_order[dish] = @menu.list[dish] * quantity
  end

  def order_total
    @current_order.values.sum
  end

  def place_order(confirmation)
    raise "Incorrect total entered, please try again" if confirmation != order_total
    order_summary
    text_confirmation
  end

  def order_summary
    "Thanks! Your order, total £#{order_total}, will be delivered by #{delivery_time}!"
  end

  def delivery_time
    "#{(Time.now + 1 * 60 * 60).hour}:#{Time.now.min}"
  end

  def text_confirmation
    # put your own credentials here
    account_sid = 'AC6b680c51845c2d7a21665e16ac1d4ebe'
    auth_token = '62e1ac8639b024c2d19c880a9cc59b6b'

    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    # # and then you can create a new client without parameters
    # @client = Twilio::REST::Client.new

    @client.api.account.messages.create(
        from: "+441412806845",
        to: "+447596833699",
        body: "#{order_summary}")
  end

  # def sms_orders
  #     post '/sms' do
  #     puts "Message: #{params['Body']}!"
  #
  #     twiml = Twilio::TwiML::MessagingResponse.new do |r|
  #       r.message(body: "Added to our list of robot sightings! Head for the hills!")
  #     end
  #     twiml.to_s
  #     end
  # end
end
