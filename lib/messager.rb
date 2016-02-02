require 'twilio-ruby'
require 'dotenv'

Dotenv.load

class Messager

  Twilio.configure do |config|
    config.account_sid = ENV['TWILIO_ACCOUNT_SID']
    config.auth_token = ENV['TWILIO_AUTH_TOKEN']
  end

  # `send` would have been more satisfactory,
  # but this is already a method on `Object`
  def send_message(to, message)
    client.messages.create(
      from: '+14159341234',
      to: to,
      body: message
    )
  end

  private

  def client
    @client ||= Twilio::REST::Client.new
  end
end
