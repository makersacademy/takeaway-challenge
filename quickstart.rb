  require 'rubygems'
	require 'twilio-ruby'
	require 'sinatra'  

  	get '/sms-quickstart' do
  		sender = params[:From]
  		friends = {
    	"+447500333666" => "Ben",
  	}
	  name = friends[sender] || "Mobile Monkey"
	  twiml = Twilio::TwiML::Response.new do |r|
	    r.Message "Hello, #{name}. Thanks for the message."
	  end
	  twiml.text
		end