require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class Confirmation

  def initialize
    @number = ENV['TO_PHONE_NUMBER']
  end

  def send_text
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    client = Twilio::REST::Client.new(account_sid, auth_token)

    from = ENV['FROM_PHONE_NUMBER']

    client.messages.create(
      from: from,
      to: @number,
      body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    )
  end

  def delivery_time
    time = Time.now
    delivered_by = (time + (60 * 60))
    delivered_by.to_s.split()[1][0,5]
  end

end
