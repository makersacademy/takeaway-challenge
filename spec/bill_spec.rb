require 'bill'

describe Bill do

  let(:bill) { Bill.new }
  let(:order) { double :order, name: 'pizza', price: 10 }

  describe '#show(order)' do
    it 'prints a bill' do
      allow(order).to receive(:each).and_return(price: 10)
      expect(bill.show(order)).to be_an_instance_of(String)
    end
  end
  describe '#total(order)' do
    it 'totals a bill' do
      allow(order).to receive(:each).and_return(price: 0)
      expect(bill.show(order)).to eq(0)
    end
  end
end
