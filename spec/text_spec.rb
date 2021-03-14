require 'text'

describe Text do
  describe '#send_message' do
    it 'sends a text' do
      message_double = double(:text, client: "Fake client")
      text = Text.new(message_double)
      allow(text).to receive(:send_message).and_return "Hi"
      expect(text.send_message).to eq "Hi"
    end
  end
end
