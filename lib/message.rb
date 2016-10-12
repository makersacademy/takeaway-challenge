#require 'rubygems'
require 'twilio-ruby'
require 'envyable'
Envyable.load('./config/env.yml', 'development')

class Message
  
  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
  end

  def send
    @client.account.messages.create({
    :from => 441277424787,
    :to => 447904432808,
    :body => "Thanks for ordering from IK's Takeaway! Your delivery will arrive at #{Time.now + 3600}.",
    })
  end
end