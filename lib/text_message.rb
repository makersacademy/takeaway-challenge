class TextMessage
  require 'twilio-ruby'
  require 'dotenv/load'

  def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(@account_sid, @auth_token)

    @from = ENV['TWILIO_FROM_PHONE_NUMBER'] # Your Twilio number
    @to = ENV['TWILIO_TO_PHONE_NUMBER'] # Your mobile phone number
  end

  def send_text(message)
    @client.messages.create(
    from: @from,
    to: @to,
    body: message
    )
  end
end
