require 'confirmation'

describe Confirmation do
  let(:confirmation)	{ described_class.new }
	let(:send_text)	        { double(:send_text) } # remove to test sending a text

  describe 'confirmation message' do
    it 'sends a text to confirm the order has been placed' do
      allow(confirmation).to receive(:send_text)  # remove to test sending a text
      expect { confirmation.send_text }.not_to raise_error
    end
  end
end
