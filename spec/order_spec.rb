require './lib/order'

describe Order do
  let(:menu) { double :menu, item: 2, name: 'rice', price: 10 }
  subject(:order) { described_class.new(menu) }

  describe '#select' do
    it 'raises an error if the item does not exist' do
      expect { order.select(8) }.to raise_error('dish does not exist')
    end

    it 'stores the selected items in @current_order if item exists' do
      order.select(2)
      expect(order.select(2)).to eq([2, 2])
    end
  end

  describe '#calc_tot' do
    it 'calculates the total of an order' do
      order.select(2)
      order.select(2)
      allow_any_instance_of(Menu).to receive(:get_item_price).and_return(10)
      expect(order.calc_tot).to eq(20)
    end
  end

  describe '#send_notification' do
    it 'returns current time +1' do
      expect(subject.send_notification).to include('Thank you')
    end
  end
end