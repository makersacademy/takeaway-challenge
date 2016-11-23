require 'twilio-ruby'

class Sms

def initialize
  @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
end


def send_message(message)
  @client.account.messages.create({
  :from => ENV['TWILIO_FROM_NUMBER'],
  :to => ENV['TWILIO_TO_NUMBER'],
  :body => message,
  })
  "Thanks for your order, a confirmation message has been sent"
end

end
