require './lib/text'

describe Text do
  subject(:text) { described_class.new }
  # let(:text) {double :text}
  # before do
  # allow(text).to receive(:send_text)
  # end

  it 'sends a payment confirmation text message' do
    expect(text.send_text).to eq 'text sent'
  end
end
