require 'twilio-ruby'

class SmsConfirmation
  
  def send_text(message)
    Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).messages.create(
          from: ENV['TWILIO_PHONE'],
          to: ENV['TWILIO_TO'],
          body: message
        )
  end
end
