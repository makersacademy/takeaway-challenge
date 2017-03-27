require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml')
class SMS
# This class sends an sms
  def send_sms(message)
    client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']

    client.messages.create(
    from: ['+441256830268'],
    to: ENV['PHONE_NUMBER'],
    body: message
    )
  end
end
