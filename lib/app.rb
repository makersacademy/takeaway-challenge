require_relative 'takeaway_app'
require("bundler")
Bundler.require()

post '/sms' do
	
	twiml = Twilio::TwiML::MessagingResponse.new do |r|
		r.message "Recieved!"
	end
	
	content_type "text/xml"

	twiml.to_s
end