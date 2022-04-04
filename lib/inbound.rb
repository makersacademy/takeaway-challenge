require("bundler")
Bundler.require()

require_relative "takeaway"
takeaway = Takeaway.new

post "/sms" do

  incoming = params['Body'].downcase

  twiml = Twilio::TwiML::MessagingResponse.new do |r|

    r.message(body: takeaway.read_text_order(incoming))
  end

  content_type "text/xml"

  twiml.to_s

end
