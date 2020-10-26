require 'twilio-ruby'

class Notification
  def send_message(message)
    client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'],
                                      ENV['TWILIO_AUTH_TOKEN'])
    from = ENV['TWILIO_NUMBER']
    to = ENV['PERSONAL_MOBILE']
    client.messages.create(from: from, to: to, body: message)
  end
end
