require 'twilio-ruby'
# require 'dotenv'
# require 'order'

account_sid = '***'
auth_token = '***'
client = Twilio::REST::Client.new(account_sid, auth_token)

# from = '+447403930982' # Your Twilio number
# to = '***' # Your mobile phone number

# client.messages.create(
# from: from,
# to: to,
# body: "Your order is being prepared! It should be with you in "
# )

class Message
    attr_reader :twilio
    def initialize(twilio = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']))
        @twilio = twilio
    end

    def send_sms(phone_number)
        time = Time.now
        delivery_time = Time.now + 1*60*60
        @twilio.messages.create({
            from: ENV['TWILIO_PHONE'],
            to: phone_number
            body: "Your order is being prepared and should be with you by #{delivery_time}."
        }
        )
        
    end
end