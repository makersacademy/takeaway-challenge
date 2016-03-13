require 'dotenv'
Dotenv.load
require 'rubygems'
require 'twilio-ruby'

class OrderConfirmation

  account_sid = ENV['TWILIO_ACCOUNT_SID']
  auth_token = ENV['TWILIO_AUTH_TOKEN']

  client = Twilio::REST::Client.new account_sid, auth_token

  # from = "441600800024"
  # to = "447871578312"
  # body = "Thank you! Your order was placed and will be delivered before 18:52"
  #
  # client.account.messages.create(
  #   to: to,
  #   from: from,
  #   body: body
  # )

##########################################

  def send_sms(message)
    from = "441600800024"
    to = "447871578312"
    body = message

    client.account.messages.create(
      to: to,
      from: from,
      body: body
    )
  end
end
