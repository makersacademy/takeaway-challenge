require 'takeaway'

describe Takeaway do

  # let(:menu) { double :menu, price: 1, contains?: true }
  # let(:order) { described_class.new(menu)}
  # subject(:takeaway) { described_class.new(order) }

  before { allow(subject).to receive(:send_text) }

  describe '#view_menu' do
    let(:menu) { double :menu, price: 1, contains?: true }
    let(:order) { described_class.new(menu) }
    subject(:takeaway) { described_class.new(order) }

    it 'shows list of menu items' do
      allow(order).to receive(:view_menu) { menu }
      expect(takeaway.view_menu).to eq menu
    end
  end

  describe '#add' do

    it 'raises error if menu item does not exist' do
      expect { subject.add(nil, nil) }.to raise_error "Menu item does not exist"
    end

    it 'returns order details' do
      expect(subject.add('Hummus', 2)).to eq "Item: Hummus | Qty: 2 | $5 - added to order"
    end
  end

  describe '#view_total' do

    before { subject.add('Hummus', 2) }
  
    it 'outputs order total' do
      expect(subject.view_total).to eq "Total: $ 10"
    end

  end

  describe '#submit_order' do

    before { subject.add('Hummus', 2) }

    it { is_expected .to respond_to(:submit_order).with(1).argument }

    it 'raises error if payment input does not equal order total' do
      expect { subject.submit_order(nil) }.to raise_error "Payment does not match order total"
    end

    it 'sends text with order details' do
      skip
    end
  end

end
