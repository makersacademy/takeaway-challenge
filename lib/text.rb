require 'twilio-ruby'
require 'dotenv/load'

class Text

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['TWILIO_NUMBER']
    to = ENV['MY_NUMBER']

    time = (Time.now+(60*30)).strftime("%H:%M")

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{time}."
    )
  end
end