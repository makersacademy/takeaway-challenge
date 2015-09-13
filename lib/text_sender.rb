require_relative '../.env.rb'
require 'twilio-ruby'

class Delivery
	def text_customer
		account_sid = ENV[:account_sid]
		auth_token = ENV[:auth_token]
		@client = Twilio::REST::Client.new account_sid, auth_token

    def delivery_time
      delivery_time = (Time.new + 3600).strftime("%H:%M")
    end

		@client.account.messages.create({
		    :to => ENV[:phone_number],
		    :from => "441496877050",
		    :body => "Thank you for your order. It will be delivered before #{delivery_time}"})
    'Your message was sent'
  end
end
