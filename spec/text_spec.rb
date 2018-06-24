require 'text'

describe Text do
  subject(:text) { described_class.new(client: client) }
  let(:client) { double(:client) }

  describe '#confirmation' do
    it 'sends a confirmaton message' do
      expect { text.confirmation(10) }.not_to raise_error
    end
  end
end
