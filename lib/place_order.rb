require 'twilio-ruby'
require_relative 'total'

class PlaceOrder

  def initialize(cost)
    @totalcost = cost
  end

  def send_text
    t = Time.new
    account_sid = 'AC62c0423831ed89621b4ab7416fedfdce'
    auth_token = 'c78573ad2fdcbf55e24fc6e10cb96a8f'

    client = Twilio::REST::Client.new(account_sid, auth_token)
    from = '+447449818019' # Your Twilio number
    to = ENV["NUMBER"] # Your mobile phone number

    client.messages.create(
    from: from,
    to: to,
    body: "Thank You! Your order was placed at #{t.strftime("%I:%M%p")} and will be delivered within 30 minutes. Total cost of order was £#{@totalcost}"
    )
  end
end
