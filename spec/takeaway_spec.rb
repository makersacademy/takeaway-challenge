require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  subject(:takeaway) { described_class.new(menu) }

  let(:dishes) { {shark: 2, lobster: 1} } #sum of 41938

  it "can order some number of several available dishes" do
    expect(order).to receive(:add).twice
    takeaway.order(dishes)
  end

  it 'knows an order total' do
    total = takeaway.order(dishes)
    expect(total).to eq(41938)
  end

end
