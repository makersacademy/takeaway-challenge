require 'twilio-ruby'


class Messenger


  account_sid = 'AC27da7bbd65e8f39fde0f311bd60229ad'
  auth_token = '{{ 7d0e678fc3c465add583bca648b955b6 }}'
  @client = Twilio::REST::Client.new account_sid, auth_token

  message = @client.account.messages.create(:body => "testing",
      :to => "+447711623411",
      :from => "+447711623411",
      :media_url => "http://www.example.com/hearts.png")
  puts message.to





end
