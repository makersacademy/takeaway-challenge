# contains the sms sending functionality by creating a new Twilio client and sending a custom message.
require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS
  
  def text_message(message)
    new_client
    @client.account.messages.create({
      :from => ENV['TWILIO_NUMBER'],
      :to => ENV['MY_NUMBER'],
      :body => message,
      })
    end

  private
    def new_client
      @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
    end
end
