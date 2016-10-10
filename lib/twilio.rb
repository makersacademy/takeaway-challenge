require 'twilio-ruby'

account_sid = "AC9260c0d2e30d8e0ed7b71f2206744564" # Your Account SID from www.twilio.com/console
auth_token = "1a3ecd829703c63b70836734592ce643"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Frances, it's REALLY LATE!",
    :to => "+447973628682",    # Replace with your phone number
    :from => "+441634540313")  # Replace with your Twilio number

puts message.sid
