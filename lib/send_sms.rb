require_relative 'Secrets'

class SendSMS

  def sms

    require 'twilio-ruby'

    account_sid = Secrets::ACCOUNT_SID
    auth_token = Secrets::AUTH_TOKEN
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = Secrets::FROM
    to = Secrets::TO

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered at " + (Time.now + 3600).to_s
    )

  end

end
