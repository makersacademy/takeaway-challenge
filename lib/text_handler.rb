require 'dotenv'
Dotenv.load('./twilio_credentials.env')
require 'twilio-ruby'

class TextHandler
  def initialize
    read_env_variables
  end

  def send_confirmation_text
    client = Twilio::REST::Client.new @account_sid, @auth_token
    client.messages.create(
      from: @takeaway_number,
      to: @order_number,
      body: create_message_body
    )
  end

  private
  
  def read_env_variables
    @account_sid = ENV['ACCOUNT_SID']
    @auth_token = ENV['AUTH_TOKEN']
    @order_number = ENV['ORDER_PHONE_NUMBER']
    @takeaway_number = ENV['TAKEAWAY_PHONE_NUMBER']
  end

  def create_message_body
    delivery_time = "#{Time.now.hour + 1}:#{Time.now.min}"
    "Thank you! Your order was placed and will be delivered before #{delivery_time}"
  end
end
