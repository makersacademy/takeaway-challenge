# require "twilio-ruby"

# class TextProvider
#   TWILIO_PHONE_NUMBER = ENV["TWILIO_PHONE_NUMBER"]
#   MY_PHONE_NUMBER = ENV["MY_PHONE_NUMBER"]
  
#   def initialize(time_formatter = TimeFormatter.new)
#     @client = Twilio::REST::Client.new(ENV["TWILIO_ACCOUNT_SID"], ENV["TWILIO_AUTH_TOKEN"])
#     @time_formatter = time_formatter
#   end

#   def send_message
#     from = TWILIO_PHONE_NUMBER
#     to = MY_PHONE_NUMBER
#     time = @time_formatter.delivery_time
#     body = "Thank you! Your order was placed and will be delivered before #{time}"
#     @client.messages.create(from: from, to: to, body: body)
#     body
#   end
# end
