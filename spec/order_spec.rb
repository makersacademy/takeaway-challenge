require 'order'

describe Order do

  let(:item) { double(:item, price: 3) }

  it 'should store orders in an array' do
    subject.place_order(item)
    expect(subject.items).to eq [item]
  end

  it 'should call the price from the item' do
    expect(item).to receive(:price)
    subject.place_order(item)
  end

  it 'should return the total order price' do
    2.times { subject.place_order(item) }
    expect(subject.order_total).to eq 6
  end

end
