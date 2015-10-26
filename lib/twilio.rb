require 'twilio-ruby'
require_relative 'takeaway'
require 'dotenv'
Dotenv.load

module Twilio

attr_reader :client

ACCOUNT_SID = ENV['ACCOUNT_SID']
AUTH_TOKEN = ENV['AUTH_TOKEN']

  def send_message(sender,receiver,client = Twilio::REST::Client)
    api_link = client.new ACCOUNT_SID, AUTH_TOKEN
    api_link.messages.create(
    from: sender,
    to: receiver,
    body: "Thank you! Your order was placed and will be delivered before #{Time.new + (60*60)}."
    )
  end
end
