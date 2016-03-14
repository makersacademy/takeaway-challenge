require 'order'

describe Order do

  subject(:order) { described_class.new(menu) }
  let(:dish) { double :dish }
  let(:price) { double :price }
  let(:menu_list) { double :menu_list, include?: true }
  let(:menu) { double :menu, read: menu_list }

  describe '#initialize' do
    it 'starts with empty order' do
      expect(order.this_order.size).to eq 0
    end
  end

  describe '#add' do
    it 'adds dishes to order' do
      expect{ order.add(dish, 1) }.to change{ order.this_order.size }.by(1)
    end
  end

  describe '#total_price' do
    xit 'calculates total price' do
      order.add(dish, 1)
      
      expect(order.total_price).to eq
    end
  end

end
