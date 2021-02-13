require 'order'

describe Order do
  let(:menu) { [{ item: 'Marinara', price: 7.50 }, { item: 'Margherita', price: 8.95 }] }

  it 'should store the items ordered' do
    expect(subject).to respond_to(:items_ordered)
  end
  it 'should store the price of each item ordered' do
    expect(subject).to respond_to(:items_price)
  end

  describe '#order_total' do
    it 'should sum the price of all the items added and return total' do
      subject.items_price << 7.5 << 7.5
      expect(subject.order_total).to eq(15)
    end
  end

  describe 'order_details' do
    it 'prints each item ordered and its price to stdout' do
      # subject.items_ordered << 'Marinara' << 'Margherita'
      # subject.items_price << 7.50 << 8.95
      # message = "TOTAL BILL: £16.45"
      # expect(subject.order_details).to output.to_stdout
    end
  end
end
