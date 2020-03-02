require 'rubygems'
require 'twilio-ruby'

class Text
  def message
    account_sid = #input ssid
    auth_token = #auth token

    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @client.messages.create(
      to: #my number,
      from: '+12057297392',
      body: "Thank you for your order, it should be with you at #{Time.now + 3600}"
    )
  end
end
