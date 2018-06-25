require 'text_confirmation'

describe TextConfirmation do
  subject(:text_confirmation) { described_class.new }

  describe '#send_message' do
    it 'sends a text message' do
      expect { text_confirmation.send_message(10) }.not_to raise_error
    end
  end
end
