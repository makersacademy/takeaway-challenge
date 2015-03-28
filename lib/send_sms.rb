require 'twilio-ruby'

account_sid = '*****'
auth_token = '*****'
@client = Twilio::REST::Client.new account_sid, auth_token

message = @client.account.messages.create(:body => "Your meal will be there in five minutes!",
    :to => "****",
    :from => "+441675292034")
puts message.to
