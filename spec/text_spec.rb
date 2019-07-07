require 'text'
describe Text do
  let(:text) { described_class.new }

  describe '#send' do
    it 'sends a message' do
      expect { text.send }.to change { text.message_sent? }.from(false).to(true)
    end
  end
end
