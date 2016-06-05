require 'dotenv'
Dotenv.load#(File.expand_path("../.env",  __FILE__))
# require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

class Messager
  # put your own credentials here

  # set up a client to talk to the Twilio REST API

  def send_confirmation
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    client = Twilio::REST::Client.new account_sid, auth_token
    client.account.messages.create ({
    from: ENV['TWILIO_NUMBER'],
    to: ENV['MY_NUMBER'],
    body: "Thank you! Your order is placed and will be delivered before #{((Time.now)+3600).strftime("%I:%M%p")}"})
  end
end
