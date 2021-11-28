# Download the twilio-ruby library from twilio.com/docs/libraries/ruby
require 'twilio-ruby'

module text_sender

    def account_sid
        account_sid = 'XXXX'
        auth_token = 'XXXXX'
        @client = Twilio::REST::Client.new(account_sid, auth_token)
    end

    def send_sms
        from = 'XXXXX' # Your Twilio number
        to = 'XXXXX' # Your mobile phone number

        @client.messages.create(
        from: from,
        to: to,
        body: "Thank you! Your order was placed and will be delivered in one hour"
        )
    end

end