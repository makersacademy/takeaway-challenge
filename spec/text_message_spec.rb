require 'text_message'

describe Text do
  subject(:text) { described_class.new }

  before do
    allow(text).to receive(:send)
  end

  it 'Send message to customer' do
    expect(text).to respond_to(:send).with(1).arguments
  end
end
