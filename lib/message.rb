require 'twilio-ruby'
require_relative 'passw'

class Message
# The confirmation message to the customer
  attr_reader :time

  def initialize
    account_sid = ACCOUNT_SID
    auth_token = AUTH_TOKEN
    # set up a client to talk to the Twilio REST API
    @client = Twilio::REST::Client.new account_sid, auth_token
    @time = Time.new
  end

  def send_confirmation(cust_number)
    @client.api.account.messages.create(
      from: '+441737652082',
      to: cust_number,
      body: "Thank you! Your order was placed and will be delivered before #{'%02d' % (time.hour + 1)}:#{'%02d' % time.min}"
    )
    true
  end
end
