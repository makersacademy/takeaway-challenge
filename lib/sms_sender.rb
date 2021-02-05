class SmsSender
  def initialize
    @expected_time = Time.now + 3600
  end

  def send
    require 'twilio-ruby'

    account_sid = 'YOUR ACCT_SID'
    auth_token = 'YOUR AUTH_TOKEN'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = 'your twilio number' # Your Twilio number
    to = 'customer number' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Hi there, your meal will be delivered by #{@expected_time.strftime("%I:%M %p")}"
    )
  end
end
