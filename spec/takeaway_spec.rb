require 'takeaway'
require 'envyable'
Envyable.load('./config/env.yml', 'test')

describe Takeaway do
  subject { described_class.new(menu) }
  let(:menu) { double [{ item: :item, price: 5 }] }

  it { is_expected.to respond_to(:add_to_order).with(1).argument }

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
    it 'creates a new order' do
      expect(menu).to receive(:dishes) { [:item] }
      subject.add_to_order(1)
      expect(subject.current_order).to be_instance_of(Order)
    end
    it 'starts a new order if no current order' do
      expect(menu).to receive(:dishes) { [:item] }
      subject.add_to_order(1)
      expect(subject.current_order).to be_instance_of(Order)
    end
    it 'adds items on menu to order' do
      expect(menu).to receive(:dishes) { [:item] }
      subject.add_to_order(1)
    end
  end

  describe '#check_order' do
    it 'calculates total price for each item' do
      expect(menu).to receive(:dishes) { [{ item: :item, price: 5 }] }
      subject.add_to_order(1)
      expect(subject.check_order).to eq 5
    end
  end

  describe '#place_order' do
    it 'sets current_order to nil' do
      expect(menu).to receive(:dishes) { [:item] }
      subject.add_to_order(1)
      subject.place_order
      expect(subject.current_order).to be_nil
    end
  end

end
