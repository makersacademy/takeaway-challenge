require 'delivery'

describe Delivery do
  ORDER_TIME = { time: Time.now }
  subject(:delivery) { described_class.new(ORDER_TIME[:time]) }

  it { is_expected.to respond_to :delivery_time }

  it 'knows what time the delivery is expected' do
    allow(delivery).to receive(:order_time).and_return(ORDER_TIME[:time])
    expect(delivery.delivery_time).to eq ORDER_TIME[:time] + Delivery::DELIVERY_ESTIMATE
  end

  it 'sends a delivery note' do
    expect(delivery.send_notification).to eq :message_sent
  end

end
