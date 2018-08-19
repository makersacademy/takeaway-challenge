require 'order'

describe Order do

  let(:menu) { double :menu, dishes: { 'item-1' => 2, 'item-2' => 3 } }
  let(:subject) { described_class.new(menu) }

  before do
    subject.add_item('item-1', 2)
    subject.add_item('item-2', 3)
  end

  it { expect(described_class).to respond_to(:new) }

  describe '#add_item' do
    it 'adds items to the order' do
      expect(subject.order.to_a.flatten.join ', ').to eq 'item-1, 2, item-2, 3'
    end
  end

  describe '#update_price' do
    it 'totals the price of the order' do
      expect { subject.update_price }.to change { subject.price }.by(13)
    end
  end

  describe '#pay' do
    it 'raises an error if incorrect amount given' do
      expect { subject.pay(10) }.to raise_error('You must give the exact amount.')
    end
  end

end
