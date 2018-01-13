require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  let(:order) { double :order }
  subject(:takeaway) { described_class.new(menu) }

  it 'knows an order total' do
    total = takeaway.order('Lobster', 2)
    expect(total).to eq(22184)
  end

end
