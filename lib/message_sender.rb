require 'twilio-ruby'
class MessageSender
attr_accessor :client



  def send_message(customer_no, message)
    account_sid = ENV['ACCT_SID']
    auth_token = ENV['AUTH_KEY']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV['TWILIO_NUM'] # Your Twilio number
    to = "#{customer_no}" # Your mobile phone number
    client.api.account.messages.create(
    from: from,
    to: customer_no,
    body: message
    )
  end

end
