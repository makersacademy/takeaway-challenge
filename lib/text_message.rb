require 'twilio-ruby'
# require 'dotenv/load'
require 'time'

class TextMessage
  attr_reader :to, :from
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @from = ENV['TWILIO_NUMBER']
    @to = ENV['YOUR_NUMBER']
  end

  def confirm
    @client.messages.create(
    from: @from,
    to: @to,
    body: "Thank you! Your order will be with you at #{(Time.now + 3600).strftime('%I:%M %p')}"
  )
  end
end
