require 'order'

RSpec.describe Order do
  let(:order_spec) { { "Classic Chicken": 2 } }

  it 'accepts an order' do
    expect(subject.add(order_spec)).to eq 'Added to Basket'
  end

  it 'stores the order' do
    subject.add(order_spec)
    expect(subject.items).to eq order_spec
  end
end
