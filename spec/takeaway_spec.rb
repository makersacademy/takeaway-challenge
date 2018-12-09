require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new }
  let(:message) { double :message, send: :txtmsg }

  describe '#checkout' do
    it 'raises an error if basket is empty' do
      error = "Basket is empty"
      expect { takeaway.checkout }.to raise_error error
    end

    it 'sends a text message confirming the order and delivery time' do
      allow(takeaway.basket).to receive(:empty?).and_return(false)

      expect(takeaway.checkout(message)).to eq :txtmsg
    end
  end

end
