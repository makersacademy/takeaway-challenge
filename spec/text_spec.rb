require 'text'

describe Text do
  describe '#send_text' do
    it 'responds to send_text' do
      expect(subject).to respond_to(:send_text)
    end
  end
end
