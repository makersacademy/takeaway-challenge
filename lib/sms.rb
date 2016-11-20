require_relative 'order'
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

  attr_reader :client

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_text(message)
    self.client.account.messages.create(
      from: ENV['TWILIO_PHONE'],
      to: "+44#{ENV['TWILIO_DESTINATION']}",
      body: message
    )
  end

  private
attr_writer :client

end
