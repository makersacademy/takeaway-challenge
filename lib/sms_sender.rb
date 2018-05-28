require 'twilio-ruby'
class SMSSender

  def send_sms(total)
    current_time = Time.new
    delivery_time = (current_time + 60*60).strftime("%H: %M")
    account_sid = 'AC7ee54cd34e63bd91c1b6b6f567232666'
    auth_token = '909520f9d41b6deec71f51c9524ff073'

    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = '+441158244971'
      to = '+447840218260'

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you for your order. Your total is: £#{total}. Your order will be deilvered at #{delivery_time}."
      )
  end
end
