
require 'twilio-ruby'
  class Mail

    def send

account_sid = ""
auth_token = ""
t = Time.now + 3600

@client = Twilio::REST::Client.new account_sid, auth_token


@client.messages.create(
  from: '+441257733xxx',
  to: '+447401333xxx',
  body: "Thank you! Your order was placed and will be delivered before #{t.strftime("%H:%M")}"
)

    end
  end
