require 'delivery'

describe Delivery do
  let(:delivery_mock) { double('delivery', send_sms: "Thank you") }

  it 'sends a message' do
    expect(delivery_mock.send_sms).to eq "Thank you"
  end
end
