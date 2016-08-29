require 'messenger'

describe Messenger do
  it 'confirms that order can be placed' do
    expect(subject).to receive(:send_sms)
    subject.confirm_order
  end

  it 'sends a confirmation message' do
    expect(subject).to receive(:send_sms)
    message = 'Thank you for your order! Delivery will be before #{subject.generate_delivery_time}'
    subject.send_sms(message)
  end
end
