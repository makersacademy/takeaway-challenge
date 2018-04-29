require 'rubygems'
require 'twilio-ruby'

class SMS

  def initialize(account_sid = nil, auth_token = nil)
    # Please add necessary authentication
    # and remove references to nil
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send(from = nil, to = nil)
    # Please pass Twilio phone number & receiving phone number
    # and remove references to nil
    @client.messages.create(
    from: from,
    to: to,
    body: "Thank you! " +
    "Your order was placed and will be delivered before #{time_hour_from_now}"
    )
  end

  private

  def time_hour_from_now
    time = Time.new
    time += 1 * 60 * 60
    time.strftime('%r')
  end

end
