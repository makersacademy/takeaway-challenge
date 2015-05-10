require 'rubygems'
require 'twilio-ruby'

 class Message_sender
  attr_accessor :message

   def initialize
    @account_sid = ENV['TWILIO_ACCOUNT_SID']
    @auth_token = ENV['TWILIO_AUTH_TOKEN']
    @client = Twilio::REST::Client.new @account_sid, @auth_token
  end

  def message
    seconds = 60*60
    @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{(Time.now + (60*60)).asctime}", :to => ENV['TWILIO_TO_TEL'], :from => ENV['TWILIO_FROM_TEL'])
  end
end
