require 'twilio-ruby'
require 'takeaway'

attr_reader :price

  def initialize(price)
    @price = price
  end

  account_sid = "ACcb4511cd7783526e6cd635315b5ac3d6"
  auth_token = "0ff11b48ff9bc219d206c0bf15043ea5"

  @client = Twilio::REST::Client.new account_sid, auth_token

  @message = @client.messages.create(
    to: "+12316851234",
    from: "+15555555555",
    body: "Your order totalling £#{price} is confirmed"
  )
