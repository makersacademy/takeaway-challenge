require 'twilio-ruby'
require 'dotenv'
Dotenv.load

module Texting

  def self.send_text

    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    from = ENV['TWIL_PHONE_NUMBER']
    to = ENV['MY_PHONE_NUMBER']

    delivery_time = Time.new + (60*60)
    message = "Thank you! Your order has been placed and delivery is scheduled for #{delivery_time.strftime('%H:%M')}"

    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.account.messages.create(
      from: from,
      to: to,
      body: message
    )

  end

end


