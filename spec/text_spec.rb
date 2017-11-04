require 'text'

describe Text do
  describe '#send_text' do
    it 'responds with 1 argument' do
      expect(subject).to respond_to(:send_text).with(1).argument
    end
  end
end
