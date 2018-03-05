require 'twilio-ruby'
require 'dotenv/load'

class Verify

  def verify_order
    puts ""
    puts ""
    puts "PLEASE CONFIRM YOUR ORDER AND TOTAL"
    puts
    puts "Press Y to confirm / Press N to edit order"
    user_confirm = gets.chomp.downcase
    send_delivery_confirmation if user_confirm == "y"
  end

  def send_delivery_confirmation(client_class = Twilio::REST::Client)
    account_sid = ENV['TWILIO_ACCOUNT_SID'] # Account SID from www.twilio.com/console
    auth_token = ENV['TWILIO_TOKEN']   # Auth Token from www.twilio.com/console
    @client = client_class.new account_sid, auth_token
    @time = (Time.now + 1*60*60).strftime('%r')
    @client.messages.create(
      to: ENV['MY_MOBILE'],
      from: ENV['MY_TWILIO_NUMBER'],
      body: "Thank you for your order. Your delicious food will arrive an hour from #{@time}")
  end
end
