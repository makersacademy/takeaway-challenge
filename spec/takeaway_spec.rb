require 'takeaway'

describe Takeaway do
  let(:order_class) { double "order_class" }
  let(:takeaway) { described_class.new(order_class)}

  it 'should be able to take a order and return the price' do
    allow(STDIN).to receive(:gets).and_return("1", "1", "", "yes")
    subject.take_order
    expect(subject.order.total_cost).to eq(6)
  end

  it 'should send a confirmation text when order is complete' do
    expect(subject).to receive(:send_text).with("message")
    subject.send_text("message")
  end
end
