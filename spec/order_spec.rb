require 'order'

describe Order do

  let(:item) { double(:item) }

  it 'should store orders in an array' do
    subject.place_order(item)
    expect(subject.items).to eq [item]
  end

  it 'should return the price of a given object' do
  end

  it 'should return the total order price' do
  end

end
