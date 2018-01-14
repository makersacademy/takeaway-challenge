# require 'twilio-ruby'
# require 'dotenv/load'
#
# class Messager
#
# attr_reader :client
#
#   def initialize
#     account_sid = ENV["TWILIO_ACC_SID"]
#     auth_token = ENV["TWILIO_AUTH_TOKEN"]
#   end
#
#   def client
#     @client = Twilio::REST::Client.new(account_sid, auth_token)
#   end
#
#   def message
#     time = (Time.now + 3600).strftime("%H:%M")
#     @message = "Thank you! Your order was placed and will be delivered before #{time}."
#   end
#
#   def confirm_order_by_text
#     @client.messages.create(
#       to: ENV["MY_PHONE_NUMBER"],
#       from: ENV["TWILIO_NUMBER"],
#       body: @message)
#   end
#
# end
