require require 'twilio-ruby'

class Notifier

  def initialize
    account_sid = "Insert your user name"
    auth_token = "Password"
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @from = "Your Twilio number"
    @to = "Your mobile phone number"
  end

  def send_message(txt)
    @client.messages.create(
    from: @from,
    to: @to,
    body: txt
    )
  end
end
