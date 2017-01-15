require 'twilio-ruby'
require 'time'

client = Twilio::REST::Client.new("AC733e80d8eb5305704027651938977331", "dcefc4c1240246c8199c00577dee0116")

delivery_time = (Time.now + (60*60)).strftime("%H:%M")

client.messages.create(
  from: "+441133205947",
  to: "+447921613637",
  body: "Thank you! Your order was placed and will be delivered before #{delivery_time}"
)
