require 'twilio-ruby'
require 'dotenv'
Dotenv.load

class SMS

  def new_client
    @client = Twilio::REST::Client.new ENV['ACCOUNT_SID'], ENV['AUTH_TOKEN']
  end
  
  def text_message(message)
    new_client
    @client.account.messages.create({
      :from => ENV['TWILIO_NUMBER'],
      :to => '+447414991117',
      :body => message,
      })
  end
end
