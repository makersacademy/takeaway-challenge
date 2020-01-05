require 'twilio-ruby'
require_relative 'takeaway'
require 'dotenv/load'

class Text

  attr_reader :client

  def initialize(client = Text.new_client)
    @client = client
  end

  def self.new_client
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(total_cost)
    @client.messages
      .create(
        body: "Thank you for your order of £#{total_cost}. Your food will be delivered in 1 hour.",
        from: "+14804675286",
        to: ENV["MY_PHONE_NUMBER"]
      )
  end

end
