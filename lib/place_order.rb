require 'twilio-ruby'
require_relative 'total'

class PlaceOrder
attr_reader :output, :totalcost

  def initialize(cost)
    @totalcost = cost
    @output = nil
  end

  def send_text
    t = Time.new
    send_time = t.strftime("%I:%M%p")
    @output = "Thank You! Your order was placed at #{send_time} and will be delivered within 30 minutes. Total cost of order was £#{@totalcost}"

    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = ENV["TWILIO_NUMBER"] # Your Twilio number
    to = ENV["NUMBER"] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: output
    )
  end
end
