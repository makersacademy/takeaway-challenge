require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

  def send_sms(message)

    @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    message = @client.account.messages.create(
        :from => ENV['TWILIO_PHONE'],
        :to => ENV['TWILIO_DESTINATION_PHONE'],
        :body => message
        )
  end
end
