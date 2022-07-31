require 'twilio-ruby'
require 'dotenv/load'

class Sms

  def initialize

    @account_sid = ENV['ACCOUNT_SID'] 
    @auth_token = ENV['AUTH_TOKEN']   
    @to = ENV['FROM']
    @from = ENV['TO']
  end

  def __send__(text)
    @client = Twilio::REST::Client.new @account_sid, @auth_token

    message = @client.messages.create(
      body: text,
      to: @to,    
      from: @from).sid

    puts "SMS Sent!"
  end

end
