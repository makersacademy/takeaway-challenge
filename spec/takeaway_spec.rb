require 'takeaway'

describe Takeaway do
  subject { described_class.new(menu) }
  let(:menu) { double [{ item: :item, price: 5 }] }

  it { is_expected.to respond_to(:add_to_order).with(1).argument }
  it { is_expected.to respond_to(:order) }

  describe '#initialize' do
    it 'has a menu' do
      expect(subject).to respond_to(:menu)
    end
  end

  describe '#see_menu' do
    it 'shows items on a menu' do
      expect(menu).to receive(:print_menu)
      subject.see_menu
    end
  end

  describe '#add_to_order' do
    it 'adds items on menu to order' do
      expect(menu).to receive(:dishes) { [:item] }
      subject.add_to_order(1)
      expect(subject.order).to eq [:item]
    end
  end

  describe '#check_order' do
    it 'calculates total price for each item' do
      expect(menu).to receive(:dishes) { [{ item: :item, price: 5 }] }
      subject.add_to_order(1)
      expect(subject.check_order).to eq 5
    end
  end

end
