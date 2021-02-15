require("bundler")
Bundler.require()

post "/sms" do

  twiml = Twilio::TwiML::MessagingResponse.new do |r|
    r.message "Woo!"
  end

  content_type "text/xml"

  twiml.to_s
end
