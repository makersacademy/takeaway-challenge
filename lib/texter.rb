require 'twilio-ruby'
require 'rubygems'
require 'dotenv'
Dotenv.load('conf.env')

class Texter
  def send_text(message)
    account_sid = ENV["TWILIO_ACCOUNT_SID"]
    auth_token = ENV["TWILIO_AUTH_TOKEN"]

    @client = Twilio::REST::Client.new(account_sid, auth_token)

    @client.messages.create(
      to: ENV["MY_PHONE_NUMBER"],
      from: ENV["TWILIO_PHONE"],
      body: message
    )
  end
end

#save below env variables using your phone numbers and Twilio details in a separate .env file to use in texter
#TWILIO_ACCOUNT_SID=xxxxxxxxxxxxxxxxxxxxx
#TWILIO_AUTH_TOKEN=xxxxxxxxxxxxxxxxxxx
#MY_PHONE_NUMBER=xxxxxxxxxxxxxxx
#TWILIO_PHONE=xxxxxxxxxxxxxxxxx
