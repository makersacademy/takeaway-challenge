class SendSMS

  def sms

    require 'twilio-ruby'

    account_sid = 'AC505597d6b16af4525a8a00a41e234bf0'
    auth_token = '884f38ce426e624e11b6c1ca464fbc5e'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441970800063'
    to = '+447771862828'

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered at " + (Time.now + 3600).to_s
    )

  end

end
