require 'messenger'

describe Messenger do
  subject(:messenger) { described_class.new }

  before do
    allow(messenger).to receive(:send_message)
  end

  it 'sends a payment confirmation text message' do
    expect(messenger).to receive(:send_message).with("Thank you for your order - will be with you shortly")
    messenger.send_message("Thank you for your order - will be with you shortly")
  end

end
