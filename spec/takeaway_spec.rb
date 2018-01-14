require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  let(:sms) { double :sms, deliver: nil}
  subject(:takeaway) { described_class.new(menu) }

  it 'knows an order total' do
    takeaway.order('Lobster', 2)
    expect(takeaway.bill).to eq(22184)
  end
end
