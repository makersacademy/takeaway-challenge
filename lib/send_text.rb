require 'twilio-ruby'

class TwilioClass
    def initialize
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]
    @client = Twilio::REST::Client.new(account_sid, auth_token)
    end

    def send
    begin
        @client.messages.create(
        to: ENV["MY_PHONE_NUMBER"],
        from: "+447429925677",
        body: "Thank you! Your order was placed and will be delivered before #{(Time.now+3600).strftime("%k:%M")}"
    )
        rescue Twilio::REST::TwilioError => e
        return false

    end
    return true
    end
end    
