require 'dotenv/load'
require 'twilio-ruby'

class Notifier

  def initialize(client_class = Twilio::REST::Client)
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']

    @client = client_class.new account_sid, auth_token
  end

  def send(message)

    message = @client.account.messages.create(:body => message,
        :to => ENV['MY_PHONE_NUMBER'],
        :from => ENV['TWILIO_PHONE_NUMBER'])

    puts message.sid

  end

end
