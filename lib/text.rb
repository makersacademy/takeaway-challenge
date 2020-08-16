require 'twilio-ruby'
require_relative 'order'

class Text

attr_reader :order, :order_correct

def initialize
  @account_sid = ENV["TWILIO_ACCOUNT_SID"]
  @auth_token = ENV["TWILIO_AUTH_TOKEN"]
  @client = Twilio::REST::Client.new @account_sid, @auth_token
  @to_number = ENV["TO_NUMBER"]
  @from_number = ENV["FROM_NUMBER"]
end

def send_text
message = @client.messages.create(
      body: "Your Thank you! Your order was placed and will be delivered before 18:52",
      to: @to_number,    # Replace with your phone number
      from: @from_number)  # Use this Magic Number for creating SMS
end

def complete_order
    send_text
end
end
