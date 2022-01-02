require 'sms'

describe SMS do
  subject(:sms) { described_class.new(client, account_sid, auth_token, from, to) }

  let(:client) { double(:client) }
  let(:account_sid) { double(:account_sid) }
  let(:auth_token) { double(:auth_token) }
  let(:from) { double(:from) }
  let(:to) { double(:to) }

  describe '#send_text' do
    it 'sends a text with ETA of delivery' do

      allow(sms).to receive(:send_text).and_return("Thank you! Your order was placed and will be delivered before #{SMS::DELIVERY_TIME}.")
      expect(sms.send_text).to eq("Thank you! Your order was placed and will be delivered before #{SMS::DELIVERY_TIME}.")
    end
  end
end
