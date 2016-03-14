require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Delivery
  def initialize(twilio_rest: Twilio::REST::Client)
    account_sid = ENV['TWILIO_SID']
    auth_token = ENV['TWILIO_TOKEN']
    @tel = ENV['SOURCE_NUM']
    @client = twilio_rest.new account_sid, auth_token
  end

  def dispatch(order)
    @message = build_message(order)
    send_message
  end

  private

  def build_message(order)
    total = order.total
    time = delivery_time
    "Thank you! Your order cost:$#{total} and will be delivered before #{time}"
  end

  def send_message(to = ENV['DEST_NUM'])
    @client.messages.create(from: @tel, to: to,body: @message)
  end

  def delivery_time
    one_hour = (60 * 60)
    (Time.now + one_hour).strftime("%I:%M%p")
  end
end
