require_relative 'twilio'
require_relative 'Takeaway'

class Takeaway

	def initialize (twilio = Twilio.new)
		@twilio = twilio
	end



	private

	def send_message
		@twilio.send_message
	end

end