require 'order'

describe Order do

  let(:order_hash) { { 1 => 3, 6 => 2, 9 => 1} }
  let(:menu_hash) { Menu.new.dishes }
  subject(:order) { described_class.new(order_hash,menu_hash) }

  describe 'class' do
    it 'creates an insatnce of Order class' do
      expect(order).to be_a(Order)
    end
  end

  describe '#total' do
    it { is_expected.to respond_to(:total).with(0).arguments }
    it 'calculates total cost of order' do
      expect(order.total).to eq(85)
    end
  end

  describe '#print_order' do
    it 'prints order to stout' do
      expect { order.print_order }.to output.to_stdout
    end
  end

end
