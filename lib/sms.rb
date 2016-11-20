require 'twilio-ruby' 
 
class SMS

	def initialize
		@account_sid = 'AC1f2d7b6fbd574ce29dcb1c8671a94908' 
		@auth_token = 'b825496c19f566086515ee13415eb30c'
		@client = Twilio::REST::Client.new @account_sid, @auth_token 
	end
 
	def send(total)
		@client.account.messages.create({
			:from => '+442033228961', 
			:to => '+447511111735', 
			:body => "Thank you. Received payment of £#{total}. Your order will be delivered by #{self.delivery_time}", 
		})
	end

	private

		def delivery_time
			(Time.now + 60 * 60).strftime("%H:%M")
		end

end