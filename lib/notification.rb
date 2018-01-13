require 'twilio-ruby'

class Notification
  def send_text(message)
    Twilio::REST::Client.new(ENV['TWILIO_ID'], ENV['TWILIO_TOKEN'])
    .api.account.messages.create(
      from: ENV['TWILIO_NUMBER'],
      to: ENV['CUSTOMER_NUMBER'],
      body: message
    )
  end
end
