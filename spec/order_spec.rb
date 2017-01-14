require 'order'

describe Order do

  let(:order_hash) { double :order_hash }
  let(:menu) { double :menu }
  subject(:order) { described_class.new(order_hash,menu) }

  context 'creation of class instance' do
    it 'creates an order insatnce' do
      expect(order).to be_a(Order)
    end
  end

  context 'total' do
    it { is_expected.to respond_to(:total).with(0).arguments }
    it 'calculates total amount for an order' do
      # ??? How to test for it properly?
    end
  end

end
