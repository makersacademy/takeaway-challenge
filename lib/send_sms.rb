require 'twilio-ruby'

class Sms
  def initialize
  end
  def time
    time = Time.new
    hour = "#{time.hour + 1}:#{time.min}"

    return hour
  end
  def sendMessage(order)
    account_sid = 'ACeaf08799fdf07e04a450f4cbf303137f'
    auth_token = '1e6b983cfda00aa789175faa8466309b'
    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+13346506074' # Your Twilio number
    to = '+447452973941' # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body:
    "Order will arrive at #{time} \nTotal Paid: #{order}"
    )
  end
end
