require 'twilio-ruby'

class Sms

  attr_accessor :message

  account_sid = 'AC137c4dc694ee724a2414c4e83d32fa59'
  auth_token = '766c3b2e6ed416c2cfaa9f46ccbad49f'

  @client = Twilio::REST::Client.new account_sid, auth_token

  message = @client.messages.create(
    from: '+441702680545',
    to: '+44 7789 858385',
    body: "Thank you! Your order was placed and will be delivered before 18:52")

  puts message.sid

end
