require 'rubygems'
require 'twilio-ruby'

class TextSender
  account_sid = 'AC22e404afa7c85c5bf71bd87b237dffb9'
  auth_token = '66284fec61bc12c45b7ba7aeaf36f142'
  @client = Twilio::REST::Client.new account_sid, auth_token

  message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before { #{(Time.new+(3600)).strftime("%I:%M%p")}}",
      :to => "+447771225759",     # Replace with your phone number
      :from => "+441582214722")   # Replace with your Twilio number
  puts message.sid
end
