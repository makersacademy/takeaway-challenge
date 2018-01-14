require 'twilio-ruby'

class SMS

  def deliver
    initiate_msg(time_of_delivery)
  end

  private

  def initiate_msg(msg)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
    from: ENV['TWILIO_PHONE'],
    to: ENV['TWILIO_DESTINATION_PHONE'],
    body: (msg))
  end

  def time_of_delivery
    time = Time.new
    "Thank you! Your order was placed and will be delivered before #{time.hour + 1}:#{time.min}"
  end
end
