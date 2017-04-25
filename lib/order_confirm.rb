require './lib/twilio_details'
require 'twilio-ruby'

$twilio_details = TwilioDetails.new

module SendMessage
    
    def SendMessage.send_msg(number, message)
        account_sid = 'AC0631fe602d98ba1c71bd5398f334cc55'
        auth_token = $twilio_details.auth_token
        from_no = $twilio_details.twilio_no
        
        # set up a client to talk to the Twilio REST API
        @client = Twilio::REST::Client.new account_sid, auth_token 
        
        @client.account.messages.create(
        from: from_no,
        to: number,
        body: message
        )
    end
end


class OrderConfirm
    
    def get_msg(message = "Your order will be delivered in one hour")
        @message = message
    end
    
    def get_num(number)
        @number = "+#{number}"
    end
    
    def send_confirm_msg
        SendMessage.send_msg(@number, @message)
    end
    
end