require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'

class Sms

  attr_reader :client

  def initialize(client = nil)
    @client = client || Twilio::REST::Client.new(
      ENV['ACCOUNT_SID'],
      ENV['AUTH_TOKEN']
    )
  end

  def send
    @client.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['RECEIVER_NUMBER'],
      body: "Thank you! Your order has been placed and will be delivered before #{one_hour_later}"
    )
  end

  private

  def one_hour_later
    (Time.now + 60*60).strftime "%H:%M:%S"
  end
end
