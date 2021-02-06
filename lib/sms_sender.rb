class SmsSender
  attr_reader :expected_time
  def initialize(contact)
    @expected_time = Time.now + 3600
    @contact = contact
  end

  def send
    require 'twilio-ruby'

    account_sid = 'YOUR ACCT_SID'
    auth_token = 'YOUR AUTH_TOKEN'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = 'your twilio number' # Your Twilio number
    to = "#{@contact}" # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{@expected_time.strftime("%I:%M %p")}"
    )
  end
end
