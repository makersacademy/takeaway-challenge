require_relative '../lib/sms'
require 'time'

describe SMS do
  let(:text) { described_class.new("1234", "abc123", "+77") }
  
  context "#initialize" do
    it 'should initialize with an account_sid' do
      expect(text.account_sid).to eq("1234")
    end

    it 'should initialize with auth_token' do
      expect(text.auth_token).to eq("abc123")
    end

    it 'should initialize with a phone_number' do
      expect(text.phone_number).to eq("+77")
    end
  end

  # it 'should send a text message with expected delivery time' do
  #   message_params = {
  #     from: "+77",
  #     to: "+771",
  #     body: "Thank you, order received! It will be delivered before 19:00"
  #   }
  #   allow(Time).to receive(:now).and_return(Time.parse("18:00"))
  #   text.send_message
  #   expect(messages).to have_received(:create).with(message_params)
  # end

end
