require 'twilio-ruby'
require 'dotenv/load'
Dotenv.load('settings.env')

class Messager

  TAKEAWAY_NAME = 'Woahaca'

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @twilio_no = ENV['TO_NUMBER']
    @client_no = ENV['FROM_NUMBER']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_confirmation(price)
    delivery_time = (Time.new + 3600).strftime('%H:%M')
    message = @client.account.messages.create(
    :body => "Thank you for ordering with #{TAKEAWAY_NAME}! Your order total is: £#{price} and will be with you by #{delivery_time}.",
    :to => @client_no,
    :from => @twilio_no
    )
  end
  
end
