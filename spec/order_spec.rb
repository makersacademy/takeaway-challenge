require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:dish) { double :dish }
  let(:menu_list) { double :menu_list }
  let(:menu) { double :menu, read: menu_list }

  describe '#initialize' do
    it 'starts with empty order' do
      expect(order.this_order.size).to eq 0
    end
  end

  describe '#add' do
    xit 'adds dishes to order' do
      allow(menu).to receive(:menu_list) { dish }
      expect{ order.add(dish, 1) }.to change{ order.this_order.size }.by(1)
    end
  end

end
