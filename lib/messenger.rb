require 'rubygems'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load
class Messenger

  attr_reader :client, :from, :to

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new account_sid, auth_token
    @from = ENV["TWILIO_NUM"]
    @to = ENV["MY_NUM"]
  end

  def message
    time = (Time.now + 60 * 60).strftime("%H:%M")
    @client.messages.create(
    from: from,
    to: to,
    body: "Thanks for your order. It should arrive before #{time}."
    )
  end

end
