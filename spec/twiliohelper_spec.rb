require 'twiliohelper'

describe TwilioHelper do
  let(:twiliohelper_false){described_class.new(send_sms_for_real: false)}
  let(:twiliohelper){described_class.new}

  context 'when testing' do
    it 'it returns the message' do
      expect(twiliohelper_false.send("Message")).to eq "Message"
    end
  end

  context 'when not testing' do
    xit 'it sends the message and returns it for confirmation' do
      expect{twiliohelper.send("Message")}.not_to raise_error
    end
  end
end
