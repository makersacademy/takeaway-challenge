require 'dotenv'
Dotenv.load
require 'twilio-ruby' 

# Wraps the Twilio Gem
class TwilioWrapper
  
  FROM = ENV['FROM']
  TO = ENV['TO']
  ID = ENV['ACCOUNT_SID']
  TOKEN = ENV['AUTH_TOKEN']
    
  def initialize(id, token)
    @client = Twilio::REST::Client.new id, token
  end
  
  def self.build
    new(ID, TOKEN)
    
  end
  
  def send(body)
    @client.account.messages.create(  from: FROM, 
                                      to: TO, 
                                      body: body ) 
  end
end
