require 'sms'



describe Sms do

  subject(:sms) { described_class.new }
  let(:cust_phone_number) { double :cust_phone_number }
  let(:twilio_number) { double :twilio_number }
  let(:client) { double :client, account: account }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :messages, create: nil }
  let(:delivery_time) { double :delivery_time }
  let(:message_details) { double :message_details }

  describe '#send_order_confirmation' do
    it { is_expected.to respond_to(:send_order_confirmation) } 


    it 'will create a message' do
      allow(sms).to receive(:send_order_confirmation) {  }
      allow(client).to receive(:account) { nil }
      allow(messages).to receive(:create).with(message_details){ nil }
      sms.send_order_confirmation
    end

  end

end
