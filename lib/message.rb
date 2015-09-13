require 'dotenv'
Dotenv.load
require 'rubygems'
require 'twilio-ruby'

class Message

  def send(number, text)
    account_sid =  ENV['account_sid']
    auth_token = ENV['auth_token']
    client = Twilio::REST::Client.new account_sid, auth_token
    from = ENV['from']
    client.account.messages.create(
    :from => from,
    :to => number,
    :body => text
    )
  end

end
