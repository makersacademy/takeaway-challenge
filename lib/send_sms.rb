require 'twilio-ruby'
#require 'dotenv/load'

class Text

  attr_reader :account_sid, :auth_token

  def initialize
  @auth_token = ENV['TWILIO_AUTH_TOKEN']
  @account_sid = ENV['TWILIO_ACCOUNT_SID'] 
    
  end

  def send_text(message = "insert text")
    @client = Twilio::REST::Client.new @account_sid, @auth_token
    @client.api.account.messages.create(
      from: ENV['FROM_TELEPHONE_NO'],
      to: ENV['TWILIO_TO_NUMBER'],
      body: message)
    true
  end
end
