require 'twilio-ruby'
require 'dotenv'
Dotenv.load


account_sid = ENV['ACCOUNT_SID']
auth_token = ENV['AUTH_TOKEN']
twilio_num = ENV['TWILIO_NUM']
my_num = ENV['MY_NUM']


    @client = Twilio::REST::Client.new account_sid, auth_token

    @client.messages.create(
      from: twilio_num,
      to: my_num,
      body: 'Hello!'
    )
