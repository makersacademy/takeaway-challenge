require 'rubygems' 
require 'twilio-ruby' 
require 'dotenv'
Dotenv.load

# I stored my Twilio account information in a environament variable saved 
# in the root of this project. I have added the .env file to gitignore. 

class Texter

  def initialize
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_ACCOUNT_AUTH']
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    @account_number = ENV['TWILIO_ACCOUNT_NUM']
  end

  def send_text(total, number)
    @client.messages.create(body: "Thank you! Your order of #{total} was placed and will be 
                            delivered before #{Time.now + 1 * 60 * 60}", 
                            from: @account_number,    
                            to: number
                            )
  end 

end
