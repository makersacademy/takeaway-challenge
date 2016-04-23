require 'rubygems'
require 'twilio-ruby'

account_sid = 'AC28b49fe674fe72904e325b4618b00b0d'
auth_token = 'b5d1fff7bce062a9b3241607df33c621'

begin
  @client = Twilio::REST::Client.new account_sid, auth_token

  message = @client.account.messages.create(:body => "test",
    :to => "+61430990824",     # Replace with your phone number
    :from => "+61400106715")   # Replace with your Twilio number
  rescue Twilio::REST::RequestError => e
  puts e.message
end