require 'twilio-ruby'
require 'time'

class TextConfirm
  attr_reader :to, :from

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = '+447401201912' # Your Twilio number
    @to = ENV['SECRET_MOBILE'] # Your mobile phone number
  end

  def confirm_order
    @client.messages.create(
      from: @from,
      to: @to,
      body: "Thank you for your order! It will be with you in #{Time.now + 3600.strftime('%I:%M %p')}"
    )
  end
end
