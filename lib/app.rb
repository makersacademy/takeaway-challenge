require 'sinatra'
require 'twilio-ruby'


post '/send_sms' do 
	to = params["07824388248"]
	message = params["Thank you! Your order was placed and will be delivered before 18:52 "]
	content_type 'text/xml'

	client = Twilio::REST::Client.new(
		ENV["AC328ae31fa3ea52b0e959f91cb768852b"],
		ENV["26b09a22f0ff29abee49033df09f963f"]
		)

	client.message.create(
	to: to,
	from: "+441494372428",
	body: message
	)

end