require 'twilio-ruby'
require 'dotenv/load'
Dotenv.load('settings.env')

class SmsSender

  def send(message)
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @client.account.messages.create({
      :from => ENV['FROM_NUMBER'],
      :to => ENV['TO_NUMBER'],
      :body => message
    })
  end
end
