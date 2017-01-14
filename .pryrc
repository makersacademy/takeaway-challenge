require './lib/twilio.rb'

message = @client.account.messages.create(:body => "Hello from Ruby",
  :to => "+447970670390",
  :from => "+441133205565")

  puts message.sid
