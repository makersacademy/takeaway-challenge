# require 'twilio-ruby'
# require 'dotenv/load'
#
# account_sid = ENV["TWILIO_ACC_SID"]
# auth_token = ENV["TWILIO_AUTH_TOKEN"]
#
# @client = Twilio::REST::Client.new(account_sid, auth_token)
# @time = (Time.now + 3600).strftime("%H:%M")
#
# @client.messages.create(
#   to: ENV["MY_PHONE_NUMBER"],
#   from: ENV["TWILIO_NUMBER"],
#   body: "Thank you! Your order was placed and will be delivered before #{time}."
#   )
