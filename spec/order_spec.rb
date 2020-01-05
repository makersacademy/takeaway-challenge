require 'order'

describe Order do

  let(:dishes) { { 'Hummus' => 5, "Pita" => 1 } }
  let(:menu) { described_class.new(dishes) }
  subject(:order) { described_class.new(menu) }
  
  before do
    allow(menu).to receive(:price).with('Hummus').and_return(5)
    allow(menu).to receive(:price).with('Pita').and_return(1)

    subject.add('Hummus', 2)
    subject.add('Pita', 1)
  end

  describe '#view_menu' do

    it 'shows list of menu items' do
      allow(menu).to receive(:all) { menu }
      expect(order.view_menu).to eq menu
    end
  end

  describe '#add' do
  
    it { is_expected .to respond_to(:add).with(2).argument }

    it 'increases total amount by price * qty' do
      expect(subject.total).to eq 11
    end

    it 'adds order hash to orders array' do
      subject.add('Pita', 7)
      expect(subject.orders[2]).to eq ({ :name => 'Pita', :price => 1, :qty => 7 })
    end

  end

  describe '#view_order' do

    it 'returns order details' do
      msg = "Item: Hummus | Qty: 2 | $10\nItem: Pita | Qty: 1 | $1\n"
      expect { subject.view_order }.to output(msg).to_stdout
    end
  end

  describe '#item_available?' do
    it 'returns true if menu item exists' do
      allow(menu).to receive(:available?).with('Hummus').and_return(true)
      expect(subject.item_available?('Hummus')).to eq true
    end

    it 'returns false if menu item does not exist' do
      allow(menu).to receive(:available?).with('Pizza').and_return(false)
      expect(subject.item_available?('Pizza')).to eq false
    end
  end
end
