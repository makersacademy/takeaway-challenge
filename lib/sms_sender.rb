require 'twilio-ruby'
class SMSSender

  def send_sms(total)
    account_sid = 'AC7ee54cd34e63bd91c1b6b6f567232666'
    auth_token = '909520f9d41b6deec71f51c9524ff073'

    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441158244971' # Your Twilio number
      to = '+447840218260' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you for your order. Your total is: #{total}. Your order will be deilvered at 18:52."
      )
  end
end
