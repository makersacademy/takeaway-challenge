require 'takeaway_order'

describe Order do

  let(:menu) { double :menu, dishes: { 'item-1' => 2, 'item-2' => 3 } }
  let(:subject) { described_class.new(menu) }

  before do
    subject.add_item('item-1', 2)
    subject.add_item('item-2', 3)
  end

  describe '#add_item' do
    it 'adds item to customer order list' do
      expect(subject.order.to_a.flatten.join ', ').to eq 'item-1, 2, item-2, 3'
    end
  end

end
