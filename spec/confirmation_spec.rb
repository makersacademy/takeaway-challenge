require_relative '../lib/confirmation'

describe Confirmation do

  let(:confirmation) { described_class.new(test = true) }

  describe '#send_text' do

    it 'sends a text confirming order placed with delivery time deadline' do
      expect { confirmation.send_text }.to output {
        "Testing. No text sent. Message would have been:\n" + confirmation.confirmation_body
      }.to_stdout
    end
  end

end
