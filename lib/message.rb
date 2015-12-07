require 'twilio-ruby'

class Message

  def send_sms
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new account_sid, auth_token

    from = '+441915801850'
    customer = ENV['TWILIO_CUSTOMER_NUMBER']

    @client.account.messages.create({
      from: from,
      to: customer,
      body: "order successfully placed"
    })
  end
end
