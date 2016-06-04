
https://www.twilio.com/docs/tutorials/walkthrough/server-notifications/ruby/sinatra#1

client = Twilio::REST::Client.new ENV['AC4fd9b8be173c7db0d962cf97115f83a0'], ENV['bff51db58515a2a9afb5b4c132d03387']


name: Carlos
phone_number: "+447577155731"



require 'rubygems' # not necessary with ruby 1.9 but included for completeness
require 'twilio-ruby'

# put your own credentials here
account_sid = 'AC4fd9b8be173c7db0d962cf97115f83a0'
auth_token = 'bff51db58515a2a9afb5b4c132d03387'

# set up a client to talk to the Twilio REST API
@client = Twilio::REST::Client.new account_sid, auth_token

# alternatively, you can preconfigure the client like so
Twilio.configure do |config|
  config.account_sid = account_sid
  config.auth_token = auth_token
end

# and then you can create a new client without parameters
@client = Twilio::REST::Client.new
Send an SMS

@client.messages.create(
  from: '+14159341234',
  to: '+16105557069',
  body: 'Hey there!'
)


=============


Notifier.send_sms
"an error has occured"

send_sms(client, phone_number, message)
twilio_number = ENV['TWILIO_NUMBER']
    message = client.account.messages.create(
      from: twilio_number,
      to: phone_number,
      body: alert_message,
      media_url: image_url
    )
    puts "An SMS notifying the last application error was "\
         "sent to #{message.to[0...-4] + "****"}"


ACCOUNT SID
AC4fd9b8be173c7db0d962cf97115f83a0

AUTH TOKEN
bff51db58515a2a9afb5b4c132d03387



https://github.com/twilio/twilio-ruby
