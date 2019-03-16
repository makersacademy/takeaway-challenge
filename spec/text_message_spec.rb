require 'text_message'

describe Text do
  subject(:text) { double Text.new }

  before do
    allow(text).to receive(:send)
  end

  it 'sends a payment confirmation text message' do
    expect(text).to receive(:send).with("Hello")
  end
end