require 'twilio-ruby'
require 'dotenv'
Dotenv.load

# def time
#   time = Time.new
#   hour = time.hour + 1
#   @time = (time.strftime("#{hour}:%M:%S")
# end

Twilio.configure do |config|
  config.account_sid = ENV["TWILIO_ACCOUNT_SID"]
  config.auth_token = ENV["TWILIO_AUTH_TOKEN"]
end

@client = Twilio::REST::Client.new TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN
message = @client.messages.create(
  from: "441412802773",
  to: "7763497067",
  body: "Hello, your order was successfully placed and will be delivered soon!"
  )

# puts message.sid
