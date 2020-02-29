require 'order'

describe Order do
  it 'initially total is zero and ordered items are nil' do
    expect(subject.total).to eq 0
    expect(subject.items).to be_empty
  end
  describe '#view_menu' do
    let(:menu) { double('Menu') }
    it 'view the list of menu with prices' do
      allow(menu).to receive(:list).and_return({ "cake" => 2 })  
      order = Order.new(menu)
      expect(order.view_menu).to eq({ "cake" => 2 })
    end
  end
  describe '#availability' do
    let(:menu) { double('Menu') }
    it 'check if the particular dish is available or not' do
      allow(menu).to receive(:available?).with('butter').and_return true
      order = Order.new(menu)
      expect(order.availability('butter')).to eq true
    end
  end  
  describe '#view_order' do
    it 'view list of dishes added which is to be ordered' do
      expect(subject.view_order).to eq subject.items
    end
  end
  describe '#add_dish' do
    context 'dish(with quantity) added to list or not' do
      it 'takes quantity default 1' do
        expect(subject.add_dish('egg roll')).to eq 1
      end
      it 'when quantity is more than 1' do
        expect(subject.add_dish('egg roll', 3)).to eq 3
      end
      it 'increments quantity when added twice' do
        expect(subject.add_dish('egg roll', 2)).to eq 2
        expect(subject.add_dish('egg roll')).to eq 3
      end
    end
  end
  describe '#total_price' do
    let(:menu) { double 'Menu' }
    it 'when multiple item added' do
      allow(menu).to receive(:price).with('Bhindi').and_return 15
      allow(menu).to receive(:price).with('Roomali roti').and_return 5
      subject { Order.new(menu) }
      subject.add_dish('Bhindi')
      subject.add_dish('Roomali roti', 2)
      expect(subject.total_price).to eq 25
    end
  end
end
