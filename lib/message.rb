require 'twilio-ruby'
require 'time'
class Message

  def initialize
    @account_sid = 'AC2fec57244f964fdba66b66f8eb2229e6'
    @auth_token = '8764b48c732da08958b31155394f62ea'
  end

  def send_confirmation(number)
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @client.messages.create(
      from: '+441252560318',
      to: number,
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now+ 3600).strftime("%H:%M")}"
    )
  end
end
