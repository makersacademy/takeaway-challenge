require 'messenger'

describe Messenger do
  subject(:test_messenger) {described_class.new dummy_twilio_class}
  let(:dummy_msg_body) {double :string}

  let(:dummy_twilio_class) {double :Client, new: dummy_twilio}
  let(:dummy_twilio) {double :client, account: dummy_account}
  let(:dummy_account) {double :account, messages: dummy_messages}
  let(:dummy_messages) {double :messages, create: nil}

  describe '#send_sms' do

    it 'creates a new message' do
      expect(test_messenger).to receive(:create_sms).with dummy_msg_body
      test_messenger.send_sms dummy_msg_body
    end

  end

end
