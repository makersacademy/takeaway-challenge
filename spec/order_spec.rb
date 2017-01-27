require 'order'

describe Order do

  let(:order_information) { { 1 => 3, 6 => 2, 9 => 1} }
  subject(:order) { described_class.new(order_information) }
  subject(:order_empty) { described_class.new }

  describe 'class' do
    it 'creates an insatnce of Order class' do
      expect(order).to be_a(Order)
    end
    context 'calculates total while initialization' do
      it 'if order hash passes' do
        expect(order.total).to eq(85)
      end
      it 'for empty' do
        expect(order_empty.total_bill).to eq("n/a")
      end
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

  describe '#add_hash_to_order' do
    let(:order_info_other) { { 2 => 1, 5 => 1} }
    it 'stores added items to order_information' do
      expect {order.add_hash_to_order(order_info_other)}.to change{order.total}.by(61)
    end
  end

  describe '#finalize_order' do
    before do
      allow(order).to receive(:send_sms)
      allow(order_empty).to receive(:send_sms)
    end
    it { is_expected.to respond_to(:finalize_order).with(0).arguments }
    it 'calculates total cost of order' do
      expect(order.finalize_order).to eq(85)
    end
    it 'prints message to stdout' do
      expect { order.finalize_order }.to output("You have placed your order, total: $85.\n").to_stdout
    end
    context 'when trying to place order without info about order' do
      it 'raises an error' do
        message = "Can't place order without information about the order: please provide what you would like to order in acceptable format."
        expect {order_empty.finalize_order}.to raise_error(message)
      end
    end
  end

end
