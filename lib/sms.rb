require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS
  def get_time
    new_time = "#{Time.now.hour+1}:#{'%02d' % Time.now.min}"
    other_new_time = "00:#{Time.now.min}"
    Time.now.hour!=24 ? new_time : other_new_time
  end

  def the_message(client, time)
  client.messages.create(
    to: ENV["TO"],
    from: ENV["FROM"],
    body: "Your order has been placed and will arrive at approx. #{time}"
  )
  end

  def send_message
    time = get_time
    client = Twilio::REST::Client.new( ENV["ID1"],ENV["ID2"])
    the_message(client, time)
  end
end
