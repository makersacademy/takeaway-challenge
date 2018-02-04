require 'text'
require 'time'

describe Text do

  subject(:text) { described_class.new(test_twilio_rest_client, test_env) }
  let(:test_twilio_rest_client) { double 'twilio rest client' }
  let(:client) { double 'client' }
  let(:messages) { double 'messages' }
  let(:test_env) { { "TWILIO_ACCOUNT_SID" => 'twilio_account_sid',
                "TWILIO_AUTH_TOKEN" => 'twilion_auth_token',
                "TWILIO_PHONE_NUMBER" => 'twilio_phone_number',
                "MY_PHONE_NUMBER" => 'my_phone_number' }
  }

  describe '#send' do

    before(:each) do
      allow(test_twilio_rest_client).to receive(:new).and_return(client)
      allow(client).to receive(:messages).and_return messages
    end

    it 'sends a text' do
      time = (Time.now + 3600).strftime("%H:%M")
      expect(client.messages).to receive(:create).with(
          from: "twilio_phone_number",
          to: "my_phone_number",
          body: "Your order will arrive by #{time}"
        )
      text.send(test_env)
    end

  end

end
