require 'twilio-ruby'
require 'dotenv/load'

class SMS

  attr_reader :time

  def confirmation
    @client.messages.create(
  from: ENV["FROM"],
  to: ENV["TO"],
  body: "Thankyou, your order has been placed and will be delivered at #{time}"
  )
  end

private

SID = ENV["TWILIO_ACCOUNT_SID"]
AUTH = ENV["TWILIO_AUTH_TOKEN"]

  def initialize(client = nil)
    @client = client || Twilio::REST::Client.new(SID, AUTH)
    @time = Time.now + (60 * 60)
  end

end
