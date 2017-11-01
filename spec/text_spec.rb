require 'text'

describe Text do
  describe '#send_text' do
    it 'responds to send_text' do
      expect(subject).to respond_to(:send_text).with(1).argument
    end
  end
  describe '#text_response' do
    it 'responds to text_response' do
      expect(subject).to respond_to(:text_response).with(1).argument
    end
  end
end