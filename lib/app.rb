require 'rubygems'
require 'twilio-ruby'
 
account_sid = "AC328ae31fa3ea52b0e959f91cb768852b"
auth_token = "26b09a22f0ff29abee49033df09f963f"
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+441494372428" 
 
friends = {
"+447824388248" => "client"
}
friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Thank you! Your order was placed and will be delivered before #{(Time.now + 60 * 60).strftime("%H:%M")}")
end
