require 'rubygems'
# require 'twilio-ruby'

class Twilio

def send_text_message
 
account_sid = ACd809165d63ca512f36f6d2e6846c2a0f
auth_token = '{{ auth_token }}'
@client = Twilio::REST::Client.new account_sid, auth_token
 
message = @client.account.messages.create(:body => "Thank you! Your order was placed and will be delivered before 18:52",
    :to => "+447710612703",     
    :from => "+447710612703")   
puts message.sid

end

end