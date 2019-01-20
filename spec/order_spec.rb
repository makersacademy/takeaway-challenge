require 'order'

describe Order do
  let(:item) { double :item }
  let(:amount) { double :amount }
  it 'orders food from menu' do
    expect(subject.customer_order(item, amount)).to eq [{ :item => item,
    :amount => amount }]
  end

  it 'takes an order hash and pushes it into an array' do
    expect(subject.take_order).to eq []
  end 
end
