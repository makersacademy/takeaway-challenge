require 'twilio-ruby'

class Twilio_text

    def send_message(message)
        
        account_sid = ENV['TWILIO_ACCOUNT_SID']
        auth_token = ENV['TWILIO_AUTH_TOKEN']
        @client = Twilio::REST::Client.new(account_sid, auth_token)

        from = "xxxxxx" 
        to = "xxxxxx" 

        @client.messages.create(
        from: from,
        to: to,
        body: message
        )
    end
end


