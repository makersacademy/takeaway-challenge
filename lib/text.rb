require 'twilio-ruby'
require_relative 'takeaway'
require 'dotenv/load'

class Text

  def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_text(total_cost)
    message = @client.messages
      .create(
        body: "Thank you for your order of £#{total_cost}. Your food will be delivered in 1 hour.",
        from: "+14804675286",
        to: ENV["MY_PHONE_NUMBER"]
      )
  end

end
