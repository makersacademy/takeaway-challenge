# A sample Gemfile
source "https://rubygems.org"
gem install twilio-ruby
gem "rails"
# require 'order'

require 'rubygems'
require 'twilio-ruby'

 
account_sid = ""
auth_token = ""
client = Twilio::REST::Client.new account_sid, auth_token
 
from = "+441263456072" # Your Twilio number

friends = {
"+" => "Rizwan Ali"}

friends.each do |key, value|
  client.account.messages.create(
    :from => from,
    :to => key,
    :body => "Hey #{value}, Monkey party at 6PM. Bring Bananas!"
  )
  puts "Sent message to #{delivery_time}"


  # def delivery_time
  # 	time = Time.new
  # 	time = time.hour.to_s + ":" + time.min.to_s
  # 	puts time
  # end




end

