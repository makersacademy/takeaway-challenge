require 'twilio-ruby'

class Messenger
  def send_confirmation
    sender
  end

  private

  def sender
    time = Time.new
    from = ENV['TWILIO_FROM_NUMBER']
    to = ENV['TWILIO_TO_NUMBER']
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV["TWILIO_AUTH_TOKEN"])
    client.messages.create(
    from: from,
    to: to,
    body: "Thank you! Your order was placed and will be delivered at #{time.hour+1}:#{time.min}!"
    )
  end
end
