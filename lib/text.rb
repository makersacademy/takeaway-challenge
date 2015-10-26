require 'rubygems'
require 'twilio-ruby'

class Text

	def initialize (text = Text.new)
		@text = text
	end

def send_text
account_sid = ACd809165d63ca512f36f6d2e6846c2a0f
auth_token = e9f6d0f3fd7848d17462e183e269b4da
@client = Twilio::REST::Client.new account_sid, auth_token
 
    sms =  @client.account.messages.create(
      :from => +441237488039,
      :to => +447710612703,
      :body => "Hi, your food will be with you before #{order_time}!"
      )
      puts sms
end

end