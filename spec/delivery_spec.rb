require 'delivery'

describe Delivery do
  ORDER_TIME = { time: Time.now }
  DELIVERY_TIME = (ORDER_TIME[:time] + Delivery::DELIVERY_ESTIMATE).strftime("%I:%M %p")

  subject(:delivery) { described_class.new(ORDER_TIME[:time]) }

  it { is_expected.to respond_to :delivery_time }

  it 'knows what time the delivery is expected' do
    allow(delivery).to receive(:order_time).and_return(ORDER_TIME[:time])
    expect(delivery.delivery_time).to eq DELIVERY_TIME
  end

  it 'sends a delivery note with the delivery time' do
    allow(delivery).to receive(:delivery_time).and_return(DELIVERY_TIME)
    expect(delivery.send_notification).to match("Thank you! You're order will be delivered before #{DELIVERY_TIME}")
  end

end
