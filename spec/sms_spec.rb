require './lib/sms.rb'

describe SMS do

let(:client) { double :client }

before(:each) { delivery_time = (Time.now + 60*60).strftime('%H:%M') }

  context "Delivery time" do
    it "should display time in hour and minutes, one hour after current time" do
      expect(subject.delivery_time).to eq(subject.delivery_time)
    end
  end

  context "Sending a message" do
   it "should send a text message" do
     message = "Thank you! Your order was placed and will be delivered before #{subject.delivery_time}."
     message_body = {:from => '+441289466028', :to => '+447825069388', :body => message}
     account_sid = 'AC9dce0a05165a925f9021ddc445ccd961'
     auth_token = '0bbc67f9bad2bf369d2bec4e1c5f525e'
     allow(client).to receive_message_chain(:account, :messages, :create).with(message_body)
     expect(Twilio::REST::Client).to receive(:new).with(account_sid, auth_token).and_return(client)
     subject.send_message
   end
  end

end
