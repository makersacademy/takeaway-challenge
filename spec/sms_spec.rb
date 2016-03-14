require 'sms'

describe Sms do

  subject(:sms) { described_class.new }
  let(:cust_phone_number) { double :cust_phone_number }
  let(:twilio_number) { double :twilio_number }
  let(:client) { double :client, account: account }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :messages, create: nil }
  
  describe '#send_order_confirmation' do
    it { is_expected.to respond_to(:send_order_confirmation) } 


    it 'will create a message' do
      allow(sms).to receive(:client) { client }
      allow(client).to receive(:account) { client }
      allow(client).to receive(:messages) { client }
      expect(client).to receive(:create)
      sms.send_order_confirmation
     
    end

  describe '#delivery_time' do

    it 'will return a time' do
      expect(sms.delivery_time.class).to eq String
  end
  end
  end
end
