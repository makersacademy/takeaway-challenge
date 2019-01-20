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

  it 'calculates total price of order' do
    subject.customer_order(:burrito, 3)
    subject.customer_order(:lobster, 2)
    subject.customer_order(:burger, 2)
    expect(subject.total_cost).to eq 120.50
  end
end
