require 'rubygems'
require 'twilio-ruby'

module Send_sms

  def confirmation

  # Get your Account Sid and Auth Token from twilio.com/user/account
  account_sid = 'AC3e91b2ba4f4e6bc3369586e5d7c1179c'
  auth_token = '89e4130a264f38b29ff740de206cd418'
  @client = Twilio::REST::Client.new account_sid, auth_token

  message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before #{Time.now.hour+1}:#{Time.now.min}",
      :to => "+447905809168",     # Replace with your phone number
      :from => "+441412802108")   # Replace with your Twilio number
  puts message.sid

  end

end