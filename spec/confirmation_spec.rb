require 'confirmation'

describe Confirmation do
  let(:confirmation)	{ described_class.new }

  describe 'confirmation message' do
    it 'sends a text to confirm the order has been placed' do
      expect { confirmation.send_text }.not_to raise_error
    end
  end
end
