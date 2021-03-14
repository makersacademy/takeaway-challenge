require 'text'

describe Text do
  describe "#send_text" do
    let(:text) { Text.new }
    let(:client) { double('Twilio::REST::Client') }
    let(:twilio_messages) { double('TwilioMessages') }

    before do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
    end

    it "sends a text" do
      allow(client).to receive(:messages).and_return(twilio_messages)
      allow(twilio_messages).to receive(:create)
      text.send_text
      expect(twilio_messages).to have_received(:create)
    end
  end
end
