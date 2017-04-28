require 'sms'
require 'hour'

describe Sms do

  subject(:sms) { described_class.new }

  describe '#send_message' do
    it { is_expected.to respond_to(:send_message) }

    before do
      allow(sms).to receive(:send_message)
    end

    it 'sends a payment confirmation text message' do
      expect(sms).to receive(:send_message)
      sms.send_message
    end
  end
end
