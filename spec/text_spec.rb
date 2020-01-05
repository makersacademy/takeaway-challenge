require 'text'

describe Text do
  let(:client) { double :client }
  subject(:text) { described_class.new(client) }
  
  before do
    allow(text).to receive(:send_text)

  end

  it 'sends a payment confirmation text message' do
    expect(text).to receive(:send_text)
    text.send_text(8)
  end

end
