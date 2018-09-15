require 'rubygems'
require 'twilio-ruby'
require 'dotenv/load'
class Message 

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_ACCOUNT_AT']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)
    @from = ENV['TWILIO_PHONE']
    @to = ENV['PHONE_NUMBER']
  end

  def send_text(body)
    @client.messages.create(
      from: @from,
      to: @to,
      body: body
    )
  end
end