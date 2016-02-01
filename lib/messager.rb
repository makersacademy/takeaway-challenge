require 'dotenv'
require 'rubygems'
require 'twilio-ruby'

class Messager
  def initialize
    @env = Dotenv.load
  end
  
  def send_text(message)
    client = Twilio::REST::Client.new @env["account_sid"], @env["auth_token"]
    client.account.messages.create(
      from: @env["from_number"],
      to: @env["to_number"],
      body: message
    )
  end
end