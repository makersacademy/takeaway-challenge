require 'twilio-ruby' 
 
class SMS
 
	def send(total)
		Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
			.messages.create(
				from: ENV['TWILIO_PHONE'],
				to: ENV['TWILIO_DESTINATION_PHONE'],
				body: message(total)
			)
	end

	private

		def message(total)
			"Thank you. Received payment of £%.2f. Your order will be delivered by #{delivery_time}" % total
		end
		
		def delivery_time
			(Time.now + 60 * 60).strftime("%H:%M")
		end

end