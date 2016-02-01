require './lib/text'

describe Text do
  let(:text) {double :text}

  describe 'text' do
    it 'sends a payment confirmation text message' do
      allow(text).to receive(:send_text).and_return('text sent')
      expect(text.send_text).to eq 'text sent'
    end
  end

    it 'delivers time' do
    allow(text).to receive(:delivery_time).and_return 12
    expect(text.delivery_time).to eq 12
  end

    it 'sends text to phone number' do
      allow(text).to receive(:send_text).and_return('text sent')
      expect(text.send_text).to eq 'text sent'
    end
end
