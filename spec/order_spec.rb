require 'order'

describe Order do
  let(:menu) { [{ item: 'Marinara', price: 7.50 }, { item: 'Margherita', price: 8.95 }] }

  it 'should store the items ordered' do
    expect(subject).to respond_to(:items_ordered)
  end
  it 'should store the price of each item ordered' do
    expect(subject).to respond_to(:items_price)
  end

  describe '#get_bill' do
    it 'should sum the price of all the items added and return total' do
      subject.items_price << 7.5 << 7.5
      expect(subject.get_bill).to eq(15)
    end
  end
end
