require 'rubygems'
require 'dotenv'
require 'twilio-ruby'

class Text
    attr_reader :credentials
    
    def initialize
        @credentials = Dotenv.load
    end
    
    def send_message(message)
        confirmation_message(message)
    end
    
    private
    
    def confirmation_message(message)
            account_sid = credentials["TWILIO_SID"]
            auth_token = credentials["TWILIO_AUTH_TOKEN"]
            client = Twilio::REST::Client.new account_sid, auth_token
            
            from = credentials["TWILIO_NUMBER"]
            
            to = credentials["MY_NUMBER"]
            
            
            client.account.messages.create(
                :from => from,
                :to => to,
                :body => message)
    end
    
    
end