require 'twilio-ruby'

class SmsConfirmation
  def confirm_order
    account_sid = 'AC2956db244b33d27eb894aae15d6af257'
    auth_token = '47a0559bf524889910850bdfe2e0cdfb'
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+447403932613'
    to = '+447761325371'

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{Time.now + 1}"
    )
  end
end
