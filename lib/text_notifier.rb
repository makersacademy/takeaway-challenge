#! /usr/bin/ruby

require 'twilio-ruby'
require 'dotenv'

time = Time.now + 3600

class TextNotifier
  def self.send_sms(number, body)
    new.send_sms(number, body)
  end

  def initialize
  end

  def send_sms(number, body)
    text(number, body)
  end

  private

  def text(number, body)
    message = client.account.messages.create(
      :body => body,
      :to => number,
      :from => config[:from]
    )
  end


  def config
    {
      account_sid: ENV["ACCOUNT_SID"],
      auth_token: ENV["AUTH_TOKEN"],
      from: ENV["FROM_PHONE"],
      to: ENV["customer_phone"],
      body: "Thank you! Your order has been placed and will be delivered before #{time.strftime("%H:%M")}"
    }
  end

  def client
    Twilio::REST::Client.new config[:account_sid], config[:auth_token]
  end
end
