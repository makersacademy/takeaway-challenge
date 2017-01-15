require 'twilio-ruby'

account_sid = "AC3817926606c83546ac6078ff817c441c" # Your Account SID from www.twilio.com/console
auth_token = "{{ 9f5d55c2547647238d940358f854dca0 }}"   # Your Auth Token from www.twilio.com/console

@client = Twilio::REST::Client.new account_sid, auth_token
message = @client.account.messages.create(:body => "Hello from Ruby",
  :to => "+4369911416267", # Replace with your phone number
  :from => "+43676800104721")    # Replace with your Twilio number

puts message.sid
