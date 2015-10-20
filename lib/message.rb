require 'rubygems'
require 'dotenv'
Dotenv.load
require 'twilio-ruby'

class Message

  def send(number, text)
    client = Twilio::REST::Client.new ENV['account_sid'], ENV['auth_token']
    client.account.messages.create( from: ENV['from'], to: number, body: text)
    :sent
  end

end
