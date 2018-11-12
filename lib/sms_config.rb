require 'twilio-ruby'
require 'dotenv/load'

class SendMessage

  def send_message(bill, estimated_time)

    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV['FROM']
    to = ENV['TO']

    client.messages.create(
    from: from,
    to: to,
    body: "Your order will be with you shortly. The order total is £#{sprintf('%.2f', bill)} and will be with you by #{estimated_time}"
    )
  end
end
