require 'order'

describe Order do

  let(:order_hash) { double :order_hash }
  let(:menu) { double :menu }
  subject(:order) { described_class.new(order_hash,menu) }

  describe 'class' do
    it 'creates an insatnce of Order class' do
      expect(order).to be_a(Order)
    end
  end

  describe '#total' do
    it { is_expected.to respond_to(:total).with(0).arguments }
    it 'calculates total cost of order' do
      # ??? How to test for it properly?
    end
  end

  describe '#print_order' do
    it 'prints order to stout' do
      # order.total
      # expect { order.print_order }.to output.to_stdout
    end
  end

end
