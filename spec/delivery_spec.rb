require 'delivery'

describe Delivery do
  let(:twilio_rest) { double :twilio_rest, new: client }
  let(:client) { double :client, messages: nil }
  subject(:delivery) { described_class.new twilio_rest: twilio_rest }
  let(:order) { double :order, total: '500.00' }

  describe '#dispatch' do
    it 'composes the sms' do
      expect(client.messages).to receive(:create)
      delivery.dispatch(order)
    end
  end
end
