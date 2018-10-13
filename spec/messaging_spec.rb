require 'messaging'
# require 'twilio-ruby'

describe Messaging do
  describe "Twilio integration" do

    it "has a twillio client available" do
      expect(subject.client).to be_an_instance_of(Twilio::REST::Client)
    end

    it "can send a message" do
      body = "message text"
      from = "000"
      to = "000"
      expect { subject.send(body, from, to) }.to raise_error(/HTTP 400] 21212/)
      expect { subject.send(body, from, to) }.to raise_error(/The 'From' number 000 is not a valid phone number/)
    end

    # describe 'send message' do
    #   it 'sends message with no error' do
    #     # expect { subject.send }.not_to raise_error
    #   end
    # end
  end

end
