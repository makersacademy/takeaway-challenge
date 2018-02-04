require 'text'

describe Text do

  describe '#sent' do

    subject(:text) { described_class.new(twilio_rest_client) }
    let(:twilio_rest_client) { double 'twilio rest client' }
    let(:client) { double 'client' }
    let(:messages) { double 'messages' }
    let(:account_sid) { double 'account_sid' }
    let(:auth_token) { double 'auth_token' }

    before(:each) do
      allow(twilio_rest_client).to receive(:new).with(
        account_sid, auth_token).and_return(client)
      allow(client).to receive(:messages).and_return messages
    end

    it 'sends a text' do
      expect(client.messages).to receive(:create).with(
          from: "twilio_phone_number",
          to: "my_phone_number",
          body: "Your order will arrive in an hour"
        )
      text.send
    end

  end

end
