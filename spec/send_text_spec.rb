require 'send_text'
require 'twilio_mock_struct'

describe SendText do
  let(:delivery_time) { double :double, generate_time: "00:00" }
  subject { described_class.new(TwilioMockStruct, delivery_time) }

  describe '#send' do
    before(:all) do
      @twilio_object = TwilioMockStruct.new("fake_sid", "fake_auth")
    end

    context 'Text message contains correct content' do
      it 'Assigns the correct destination number to the message' do
        allow(TwilioMockStruct).to receive(:new).and_return(@twilio_object)
        subject.send
        expect(@twilio_object.message[:to]).to eq '+447891111865'
      end

      it 'Assigns the correct time to the body' do
        allow(TwilioMockStruct).to receive(:new).and_return(@twilio_object)
        subject.send
        expect(@twilio_object.message[:body]).to eq "Thank you! Your order was placed and will be delivered before 00:00"
      end
    end

    context 'Reports error if text message fails to send' do
      it 'Raises error if no message SID is provided' do
        allow(TwilioMockStruct).to receive(:new).and_return(@twilio_object)
        @twilio_object.sid = nil
        expect { subject.send }.to raise_error("Sorry, text message failed to send!")
      end
    end
  end
end
