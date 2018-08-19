require 'send_text'
require 'twilio_mock_struct'

describe SendText do
  subject { described_class.new(TwilioMockStruct) }

  describe '#send' do

    it 'Assigns the correct destination number to the message' do
      twilio_object = TwilioMockStruct.new("fake_sid", "fake_auth")
      allow(TwilioMockStruct).to receive(:new).and_return(twilio_object)
      subject.send
      expect(twilio_object.message[:to]).to eq '+447891111865'
    end

    it 'Assigns the correct time to the body' do
      twilio_object = TwilioMockStruct.new("fake_sid", "fake_auth")
      allow(TwilioMockStruct).to receive(:new).and_return(twilio_object)
      subject.send
      expect(twilio_object.message[:body]).to eq "Thank you! Your order was placed and will be delivered before"
    end

    it 'Raises error if no message SID is provided' do
      twilio_object = TwilioMockStruct.new("fake_sid", "fake_auth")
      allow(TwilioMockStruct).to receive(:new).and_return(twilio_object)
      twilio_object.sid = nil
      expect { subject.send }.to raise_error("Sorry, text message failed to send!")
    end
  end
end
