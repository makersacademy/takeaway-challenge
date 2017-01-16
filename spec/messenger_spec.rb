require "messenger"

describe Messenger do
  subject(:messenger) { described_class.new }

  describe '#send_delivery_message' do
    it 'sends a payment confirmation text message' do
      expect(messenger).to respond_to(:send_message).with(1).argument
    end
  end

end
