require './lib/text'

describe Text do
    subject(:text) { described_class.new }
        let(:text) {double :text}
    before do
    allow(text).to receive(:send_text)
    end

  it 'sends a payment confirmation text message' do
    expect(text).to respond_to(:send_text)
  end
end
