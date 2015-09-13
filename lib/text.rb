require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Text
  def self.send_text_message
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token

    Twilio.configure do |config|
      config.account_sid = account_sid
      config.auth_token = auth_token
    end

    @client = Twilio::REST::Client.new

    @client.messages.create(
      from: '+441942316749',
      to: '+447497811148',
      body: "Thank you! Your order was placed and will be delivered before
        #{(Time.now + 3600).strftime('%H:%M')}")
  end
end
