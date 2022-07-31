require 'twilio-ruby'

class SMS
    def initialize(config, client: nil)
        @client = client || Twilio::REST::Client.new(config[:account_sid, config[:auth_token]])
    end 

    def deliver
    end 
end 