require 'shop'

describe Shop do
  let(:order) { double(:order) }
  let(:user) { double(:user) }
  it 'can take an order' do
    subject.take_order(order, user)
    expect(subject.orders).not_to be_empty
  end
  it 'can increment the order number by 1' do
    subject.take_order(order, user)
    expect(subject.orders[1]).not_to be_nil
  end
  it 'knows how many orders it has' do
    subject.take_order(order, user)
    expect(subject.total_orders).to eq 1
  end

end
