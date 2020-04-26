require 'order'

describe Order do

  let(:carbonara) { double('Carbonara', name: 'Carbonara', price: '10.50')}
  let(:forcaccia) { double(name: 'Forcaccia', price: '2.00') }
  let(:lasagne) { double(name: 'Lasagne', price: '8.90') }
  let(:italian_menu) { double('Italian', items: [carbonara, forcaccia, lasagne]) }
  let(:messenger) { double() }
  let(:subject) { described_class.new(italian_menu, messenger) }
  it { is_expected.to respond_to(:order_items) }
  it { is_expected.to respond_to(:add_item).with(2).arguments }

  it 'is bound to a menu on creation' do
    subject = described_class.new(italian_menu)
    expect(subject.menu).to eq(italian_menu)
  end

  describe '#add_item' do
    it 'it adds 3 orders of "Carbonara" to order_items' do
      subject = described_class.new(italian_menu)
      expect { subject.add_item("Carbonara", 3) }.to change { subject.order_items }.to include(carbonara => 3)
    end

    it 'it adds 1 order of "Forcaccia" to order_items' do
      subject = described_class.new(italian_menu)
      expect { subject.add_item('Forcaccia', 1) }.to change { subject.order_items }.to include(forcaccia => 1)
    end

    it 'it adds 1 order of "Lasagne" and then another order' do
      subject = described_class.new(italian_menu)
      subject.add_item('Lasagne', 1)
      expect { subject.add_item('Lasagne', 1) }.to change { subject.order_items }.to include(lasagne => 2)
    end

    it 'raises an error if an item not on the menu is requested' do
      subject = described_class.new(italian_menu)
      expect { subject.add_item('Gelato', 1) }.to raise_error('Item not on menu')
    end
  end

  describe '#order_total' do
    it 'returns the order total' do
      subject = described_class.new(italian_menu)
      subject.add_item('Carbonara', 1)
      subject.add_item('Forcaccia', 3)
      subject.add_item('Lasagne', 1)
      expect(subject.order_total).to eq(25.4)
    end
  end

  describe '#confirm_order' do
    it 'calls on messenger to send a confirmation if order total was correct' do
      subject = described_class.new(italian_menu, messenger)
      subject.add_item('Carbonara', 1)
      subject.add_item('Forcaccia', 3)
      subject.add_item('Lasagne', 1)
      expect(messenger).to receive(:send_confirmation_message)
      subject.confirm_order(25.4)
    end

    it 'raises an error if order total is incorrect' do
      subject = described_class.new(italian_menu, messenger)
      subject.add_item('Carbonara', 1)
      subject.add_item('Forcaccia', 3)
      subject.add_item('Lasagne', 1)
      expect { subject.confirm_order(10) }.to raise_error('Order totals do not match')
    end
  end
end
