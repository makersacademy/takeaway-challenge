require 'rubygems'
require 'twilio-ruby'
require 'time'

class ConfirmationTextSender

  def send_message(message)

    account_sid = 'AC9418dc2fc0bb5cbb33e505c227d3a3c1'
    auth_token = '5490266efdf7640c6e1d59a7da563967'
    @client = Twilio::REST::Client.new account_sid, auth_token

    @message = @client.messages.create(
      to: "+447984599636",
      from: "+441173253687",
      body: "Hi from FOOD! Your order has cost £#{message} and will arrive at #{calculate_time}."
    )
  end

  def calculate_time
    delivery_time = Time.now + 30*60
    format_time = delivery_time.strftime("%I:%M%p")
  end
end