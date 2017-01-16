require 'twilio-ruby'

class TextMessage
    
    def initialize(client_details, client = Twilio::REST::Client.new(client_details[:account_sid], client_details[:auth_token]))
        @client_details = client_details
        @client = client
    end
    
    def send
        client.account.messages.create(message_details)
    end
    
    private
    
    def message_details
        {
            from:   client_details[:from],
            to:     client_details[:to],
            body:   client_details[:body] % delivery_time
        }
    end
    
    def delivery_time
        (Time.now + 60 * 60).strftime("%H:%M")
    end
    
    attr_reader :client_details, :client
end