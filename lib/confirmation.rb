require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Confirmation

  def initialize(order, number)
    @order = order
    @number = number
  end

  def send_text
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['FROM_PHONE_NUMBER']
    to = ENV['TO_PHONE_NUMBER']

    client.messages.create(
      from: from,
      to: to,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
    
  end

  def delivery_time
    time = Time.now
    1h_later = time + (60 * 60)
    1h_later.to_s.split(" ")[1][0,5]
  end

end
