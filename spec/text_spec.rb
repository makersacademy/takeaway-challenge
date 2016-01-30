require './lib/text'

describe Text do
  let(:text) {double :text}

  describe 'text' do
    it 'sends a payment confirmation text message' do
      allow(text).to receive(:send_text).and_return('text sent')
      expect(text.send_text).to eq 'text sent'
    end
  end
end
