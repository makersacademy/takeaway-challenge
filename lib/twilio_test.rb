require 'twilio-ruby'
require 'dotenv'

module send_sms
Dotenv.load
# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new(
ENV["TWILIO_ACCOUNT_SID"],
ENV["TWILIO_AUTH_TOKEN"]
)
@client.account.messages.create({
  :from => ENV['TWILIO_PHONE_NUMBER'],
  :to => ENV['MOBILE_NUMBER'],
  :body => 'Your order is planned for delivery at 22.31',
})
end
#task is to set up message content with stubs etc.
#run twilio_test.rb ruby from command line

def generate_sms
  time = Time.now.to_a
  houradjust = time[2]+1
  "Thank you for your order. Your food will arrive before " +
    houradjust.to_s + ":" + time[1].to_s
end
