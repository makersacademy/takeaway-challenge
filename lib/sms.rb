require 'twilio-ruby'
require 'dotenv/load'

class SMS

  SID = ENV["TWILIO_ACCOUNT_SID"]
  AUTH = ENV["TWILIO_AUTH_TOKEN"]
  attr_reader :time

  def initialize(client = nil)
    @client = client || Twilio::REST::Client.new(SID, AUTH)
    @time = Time.now + (60 * 60)
  end

  def confirmation
    @client.messages.create(
  from: ENV["FROM"],
  to: ENV["TO"],
  body: "Thankyou, your order has been placed and will be delivered at #{time}"
  )
  end

end
