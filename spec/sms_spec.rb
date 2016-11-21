require './lib/sms.rb'
require 'dotenv'
Dotenv.load

describe Sms do

let(:client) { double :client }

let(:delivery_time) { (Time.now + 60*60).strftime('%H:%M') }

#let(:takeaway) {double :takeaway}


  context "Sending a message" do
   it "should send a text message" do
     message = "Thank you! Your order was placed and will be delivered before #{delivery_time}."
     message_body = {:from => ENV['TWILIO_PHONE'], :to => ENV['TWILIO_DESTINATION_PHONE'], :body => message}
     allow(client).to receive_message_chain(:account, :messages, :create).with(message_body)
     expect(Twilio::REST::Client).to receive(:new).with(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN']).and_return(client)
     #allow(takeaway).to receive()
     subject.send_message
   end
  end

end
