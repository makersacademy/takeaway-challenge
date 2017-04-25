#Edit the info below then delete the _template part from this file in order to use the order confirm class

class TwilioDetails
    attr_reader :auth_token, :twilio_no
    
    def initialize
        @auth_token = 'Your Twilio AUTH TOKEN'
        @twilio_no = 'Your Twilio Number'
    end
end