require 'rubygems'
require 'twilio-ruby'
require 'dotenv'

class SendSMS


  def initialize(message)
    Dotenv.load
    account_sid = ENV['ACCOUNT_SID']
    auth_token = ENV['AUTH_TOKEN']
    @client = Twilio::REST::Client.new account_sid, auth_token
    @message = message
    send_message
  end

  def send_message
    @client.account.messages.create({
      :from => ENV["PHONE_NUMBER_FROM"],
      :to => ENV["PHONE_NUMBER_TO"],
      :body => @message
    })
  end

end
