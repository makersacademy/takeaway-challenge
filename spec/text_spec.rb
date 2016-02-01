require 'text'

describe Text do
  let(:text) { double :text, send_text: nil }

  describe '#send_text' do
    it 'sends a text' do
      expect(text).to receive (:send_text)
      text.send_text
    end
  end
end
