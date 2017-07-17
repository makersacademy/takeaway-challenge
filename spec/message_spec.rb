require 'message'

describe Message do
let(:message) { described_class.new}

before do
    allow(takeaway).to receive(:send_sms)
  end

  it 'sends a text to confirm the order has been placed' do
    expect(message).to receive(:send_sms).with("Thank you for ordering at MA Pizzeria")
  end
end
