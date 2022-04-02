require 'takeaway'

describe Takeaway do
  it 'should be able to take a order and return the price' do
    subject.take_order
    expect(subject.order.cost).to eq(1)
  end

  it 'should send a confirmation text when order is complete' do
    subject.take_order
    expect(subject).to receive(:send_text).with("message")
    subject.send_text("message")
  end
end