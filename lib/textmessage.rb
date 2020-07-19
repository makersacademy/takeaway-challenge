require 'twilio-ruby'
account_sid = ENV['ACCOUNT_SID']
auth_token = ENV['AUTH_TOKEN']
phone_num = ENV['PHONE_NUM']
twilio_num = ENV['TWILIO_NUM']
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages.create(
                             body: "Hi your order is as follows: ",
                             from: twilio_num,
                             to: phone_num
                           )