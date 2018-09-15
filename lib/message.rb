require 'twilio-ruby'
require 'dotenv/load'
require 'time'

class Message 
  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_ACCOUNT_AT']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = '+44 7479 270740'
    @to = '+44 7463 233745'
  end

  def send_text(body)
    @client.messages.create(
      from: @from,
      to: @to,
      body: body
    )
  end

end