require 'twilio-ruby'
require 'dotenv/load'
require_relative 'menu'
require_relative 'basket'

class Takeaway

  def initialize
    @menu = Menu.new
    @basket = Basket.new
  end

  def complete_order(total_price)
    send_text(total_price)
  end

  private

  def send_text(total_price)
    account_sid = ENV['TWILIO_ACCOUNT_SID'] # Your Account SID from www.twilio.com/console
    auth_token = ENV['TWILIO_AUTH_TOKEN']   # Your Auth Token from www.twilio.com/console

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.messages.create(
        body: "Thank you! Your order for £#{'%.2f' % total_price} was placed and will be delivered before #{(Time.new + 60*60).strftime("%I:%M %p")}",
        to: ENV['PHONE_NUMBER'],    # Replace with your phone number
        from: ENV['TWILIO_NUMBER'])  # Replace with your Twilio number

    puts message.sid
  end

end
