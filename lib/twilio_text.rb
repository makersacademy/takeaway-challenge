
require 'twilio-ruby'
require_relative '../.env.rb'

class TwilioText

  def send_text
    account_sid = ENV['account_sid']
    auth_token = ENV['auth_token']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.messages.create(
      from: ENV['phone'],
      to: ENV['my_phone'],
      body: "Thank you! Your order was placed and will be delivered by #{time}")
  end

  def time
    (Time.now + 60*60).strftime('%H:%M')
  end

end