require 'text'

describe Text do
  subject(:text) { described_class.new }

    before do
      allow(text).to receive(:send_message)
    end

    xit 'sends a delivery confirmation text message once initialized' do
      expect(text).to receive(:send_message).with("Your order will be delivered at 15:15")
      Text.new
      text.send_message
    end

  end
