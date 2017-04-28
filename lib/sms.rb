require 'twilio-ruby'
require_relative 'hour'
require 'dotenv/load'

class Sms

  def initialize
    account_sid = ENV['ACCOUNT_SID']
    auth_token  = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send_message
    text = "Thank you! Your order was placed and will be delivered before #{Hour.new.eta_to_string}"
    message = @client.account.messages.create(:body => text,
        :to => ENV['PHONE'],
        :from => "+441293311504")
    puts message.sid
  end

end
