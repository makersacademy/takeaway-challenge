require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Text

  def self.send_text_message(name, phone_number)
    account_sid = ENV["ACCOUNT_SID"]
    auth_token = ENV["AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: '+441942316749',
      to: phone_number,
      body: "Thank you, #{name}! Your order was placed and will be delivered before
        #{(Time.now + 3600).strftime('%H:%M')}")
  end

end
