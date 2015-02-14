require 'rubygems'
require 'twilio-ruby'

# Get your Account Sid and Auth Token from twilio.com/user/account
account_sid = 'ACd7e183a027dbce9720341d1053705052'
auth_token = 'fa5386f7c33d3f83b6a382ad8564261d'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "shsssh chops<3",
    :to => "+447769111156",     # Replace with your phone number
    :from => "+441412804108")   # Replace with your Twilio number
puts message.sid


# begin
#     client = Twilio::REST::Client.new account_sid, auth_token
#     client.account.messages.create(
#       from => from_number,
#       to =>   to_number,
#       body => "Hello World"
#     )
# rescue Twilio::REST::RequestError => e
#     puts e.message
# end