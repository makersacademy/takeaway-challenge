require 'twilio-ruby'

class Message
  def send(number)
    account_sid = '' #private
    auth_token = '' #private
    client = Twilio::REST::Client.new(account_sid, auth_token)

    time = Time.now
    time = time + 3600

    number = "#{number}"

    from = '' # Your Twilio number #private
    to = number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered before #{time.strftime("%F %T")}"
    )
  end
end
