require 'text_sender'

describe TextSender do
  subject(:sender) { described_class.new }

  describe '#text' do
    it 'expected to send texts' do
      expect { sender.text }.not_to raise_error
    end
  end
end
