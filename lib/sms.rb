require 'twilio-ruby'

class SMS

  def initialize
    @account_sid = "AC838244b92a9293a5b91fade646c0a2fa"
    @auth_token = "20ec4e143070d8604ba53c177fe5c155"
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

    # "AC838244b92a9293a5b91fade646c0a2fa"
    # auth_token = "20ec4e143070d8604ba53c177fe5c155"

  def send_message
    client.account.messages.create(
      from: '+441454300035',
      to: '+447548177942',
      body: "Thank you! Your order was placed and will be delivered before #{(Time.now + 45*60).strftime("%H:%M")}"
      )
  end

  private
  attr_reader :account_sid, :auth_token, :client
end
