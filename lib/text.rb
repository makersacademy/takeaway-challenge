require 'twilio-ruby'

class Text

    def initialize
        @client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    end

    def send_confirmation
        @client.messages.create(
            from: ENV["TWILIO_NUMBER"],
            to: ENV["MY_NUMBER"],
            body: "Thank you for ordering with us, your order will be ready by #{(Time.now + 3600).strftime("%k:%M")}"
        )
    end


end