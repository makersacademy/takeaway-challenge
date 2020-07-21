require 'twilio-ruby'
require 'sinatra'


post '/sms' do
  # transform request body to lowercase
  body = params['Body'].downcase

  # Build response based on given body param
  twiml = Twilio::TwiML::MessagingResponse.new do |resp|
    if body == 'hello'
      resp.message body: "Hi!, Welcome to Pea's takeaway!"
    elsif body == 'bye'
      resp.message body: 'Goodbye'
    end
  end

  twiml.to_s
end
