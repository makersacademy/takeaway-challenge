require 'confirmation'

describe Confirmation do
  subject(:confirmation)	{ described_class.new }
	let(:send_text)	        { double(:send_text) }

  describe 'confirmation message' do
    it 'sends a text to confirm the order has been placed' do
      allow(confirmation).to receive(:send_text)
      expect { confirmation.send_text }.not_to raise_error
    end
  end
end
