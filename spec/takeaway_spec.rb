require 'takeaway'

describe Takeaway do

  # let(:dishes) { { 'Hummus' => 5, "Pita" => 1 } }
  # let(:menu) { described_class.new(dishes) }
  # let(:order) { described_class.new(menu) }
  # subject(:takeaway) { described_class.new(order) }
  
  # before do
  #   allow(menu).to receive(:price).with('Hummus').and_return(5)
  #   allow(menu).to receive(:price).with('Pita').and_return(1)

  #   allow(order).to receive(:item_available?).with('Hummus').and_return(true)
  #   allow(order).to receive(:item_available?).with('Pita').and_return(true)

  #   subject.add('Hummus', 2)
  #   subject.add('Pita', 1)
  # end

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

    it 'returns details of dish added to order' do
      expect(subject.add('Hummus', 2)).to eq "Item: Hummus | Qty: 2 | $5 - added to order"
    end
  end

  describe '#view_order' do
    before { subject.add('Hummus', 2) }
    before { subject.add('Pita', 1) }

    it 'returns order details' do
      msg = "Item: Hummus | Qty: 2 | $10\nItem: Pita | Qty: 1 | $1\n"
      expect { subject.view_order }.to output(msg).to_stdout
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

    let(:text) { double :text }

    it 'raises error if payment input does not equal order total' do
      err = "Payment does not match order total"
      expect { subject.submit_order(nil) }.to raise_error err
    end

    it 'sends text with order details' do
      subject.submit_order(10)
    end
  end

end
