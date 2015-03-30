require 'customer'
describe Customer do
  let(:order) { double :order }
  it 'can add an order' do
    expect(subject.add_order(order)).to eq order
  end
end
