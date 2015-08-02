# class Sms do

# require 'twilio-ruby'

# account_sid = 'ACeb3d54179246ef24636b888fff9d7eb1' 
# auth_token = '0faa55e7900d0f6c7a8b5411da7422f6' 

# @client = Twilio::REST::Client.new account_sid, auth_token 
 
# message = @client.account.messages.create(:body => "Your order is on the way", 
#  :to => "+447881772377"
#  :from => "+14158141829"
#  :url => "wwww.working.com")

# puts message.to

# end