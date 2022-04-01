require 'rubygems'
require 'twilio-ruby'

class Order_confirmation

  def text_message

  account_sid = 'ACbd5d9bebb38ff6e46ea9426ec80f0f6d'
  auth_token = '6dbf8df5888bf320d8949c456dcde209'

  client = Twilio::REST::Client.new(account_sid, auth_token)

  message = client.messages.create(
      to: "+447824701051",
      from: "+447360542270",
      body: "Thank you! Your order was placed and will be delivered before 18:52")

    puts message.sid
  end
# def send_confirmation_text
#   client = TwilioAdapter.new
#   client.send_sms(
#     to: customer.mobile_phone_number,
#     body: "Your verification code is #{verification_code}"
#   )
# end

end
