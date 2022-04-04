require 'twilio-ruby'

class TwilioTextMessenger
    attr_reader :message, :call
  
    def initialize
        @message = message
        account_sid = 'ACf27cbbcdf904e00bcf60428cfb4271c9'
        auth_token = '18303ff4fddfac8208b8be0aab167886'
        client = Twilio::REST::Client.new(account_sid, auth_token)
        client.messages.create(
            from: 'my twilio number',
            to: 'my phone number',
            body: "Thank you! Your order was placed and will be delivered before #{Time.now + 1*60*60}"
            )
    end
end