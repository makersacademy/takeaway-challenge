require 'twilio-ruby'

# account_sid = "AC121197d0525c9f7d74a983b70e6a0d99" # Your Test Account SID from www.twilio.com/console/settings
# auth_token = "d656137ae48c5dd42e52f3202ef8edd7"   # Your Test Auth Token from www.twilio.com/console/settings

# client = Twilio::REST::Client.new(account_sid, auth_token)

# client.messages.create(
#   from: +12014706871,
#   to: +447575309812,
#   body: "Hey Bish!"
# )

class SMS
  def inititalize(credentials: {})
    @credentials = credentials
    @client = Twilio::REST::Client.new(@credentials["sid"], @credentials["auth_token"])
  end

  def set_credentials(credentials)
    @credientials = credentials
  end

  def send_sms(body, number)
    @client.messages.create(
      from: credentials["number"],
      to: number,
      body: body
    )
  end
end