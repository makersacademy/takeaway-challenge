require_relative '../lib/message.rb'

describe Message do
  time = Time.now
  subject(:message) { described_class.new(time) }
  delivery_time = (time + Message::DELIVERY_TIME).strftime('%I:%M %p')

  it 'should know what time the order was completed' do
    expect(subject.order_timestamp).to eq time
  end

  it 'should know how long delivery will take' do
    expect(subject.delivery_time). to eq(time + Message::DELIVERY_TIME).strftime('%I:%M %p')
  end

  it 'should send a message' do
    expect(message.send_sms).to eq "Message sent to end customer. Your order will be delivered at #{delivery_time}"
  end
end
