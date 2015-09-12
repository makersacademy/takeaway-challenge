require 'twilio-ruby'
class Delivery

  def send_sms
    account_sid = 'AC279fc8810e702c33e972ad9178c3ebab'
    auth_token = '0d95e1d8b7485eef12abc805049b8d3c'


    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: '441496877050',
      to: '+447590425818',
      body: 'Thank you! Your order was placed and will be delivered before #{(Time.new + 3600).strftime("%H:%M")}'
    )
     "Thank you for your order, you will recieve a text confirmation shortly."

  end

end
