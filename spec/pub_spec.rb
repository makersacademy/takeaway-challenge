require "pub"

describe Pub do
  let(:pub) { Pub.new(order) }
  let(:order) { double :order }
  it "receives the order and makes the food" do
    # gives warning of allowing expectations on nil - is this a valid test?
    expect(order).to receive(:items).twice
    allow(order.items).to receive(:each)
    pub.read_and_make
  end
end
