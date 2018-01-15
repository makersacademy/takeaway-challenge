require 'order'

describe Order do
  subject(:order) { described_class.new(menu) }
  let(:menu) { double :menu, read: { 'spring rolls' => 1.99, 'prawn toast' => 1.99,
     'egg fried rice' => 2.50, 'kung po chicken' => 4.50 }
  }

  it 'returns the quantity ordered' do
    allow(menu).to receive(:contains?).and_return(true)
    expect(order.add('spring rolls', 4)).to eq 4
  end

  context 'with a full meal' do
    before do
      order.add('spring rolls')
      order.add('prawn toast')
      order.add('egg fried rice')
      order.add('kung po chicken')
    end

    describe '#order_summary' do
      it 'returns an itemised bill' do
        summary = "1 x Spring rolls -- £1.99\n1 x Prawn toast -- £1.99\n" +
        "1 x Egg fried rice -- £2.50\n1 x Kung po chicken -- £4.50\nTotal is £10.98"
        expect(order.summary).to eq summary
      end

      it 'raises an error if you order food not stocked' do
        error = "Sorry, we don't do that dish here."
        expect { order.add('FISH') } .to raise_error error
      end
    end

    describe '#check_total' do
      it 'returns true if the total is correct' do
        expect(order.check_total(10.98)).to eq true
      end
    end
  end
end
