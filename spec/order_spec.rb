require 'order'

describe Order do

  let(:menu) { double :menu }

  subject { described_class.new(menu) }

  before(:each) do
    allow(menu).to receive(:items).and_return({ "Nan" => 2.2, "Rice" => 2.70, "Aloo Gobi" => 4.10, "Sag Paneer" => 4.30, "Daal Makhani" => 6.10 })
  end

  describe '#print_menu' do

    it 'returns the menu' do
      allow(menu).to receive(:print).and_return Menu::ITEMS
      expect(subject.print_menu).to eq Menu::ITEMS
    end
    # unsure how to test this or whether to test this - it is behaviour of the menu class that I have already tested
    # it 'prints the menu' do
    #     allow(menu).to receive(:print).and_output("Nan: £2.20\nRice: £2.70\nAloo Gobi: £4.10\nSag Paneer: £4.30\nDaal Makhani: £6.10\n").to_stdout
    # end
  end

  describe '#add' do

    it 'allows user to place order' do
      subject.add("Nan", 1)
      expect(subject.order).to include("Nan" => 1)
    end

    it 'raises an error if a dish is not available' do
      expect { subject.add("Chicken Korma") }.to raise_error "Item not available"
    end

  end

  describe '#total_price' do

    it 'shows user the price of their order for one item' do
      subject.add("Nan", 1)
      expect(subject.total).to eq 2.2
    end

    it 'shows user the price of their order for two items' do
      subject.add("Nan", 2)
      subject.add("Aloo Gobi", 1)
      expect(subject.total).to eq 8.5
    end
  end

  describe '#place' do
    it 'raises an error if no items added to order' do
      expect { subject.place } .to raise_error "No items in order"
    end
  end
end
