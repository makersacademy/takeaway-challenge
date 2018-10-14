require 'menu_view'

describe MenuView do

  context 'display' do
    let(:item1) { double :item1, name: 'item1', price: 8 }
    let(:item2) { double :item2, name: 'item2', price: 8 }
    let(:item3) { double :item3, name: 'item3', price: 8 }
    let(:menu) { [item1, item2, item3] }
    subject { described_class.new(menu) }

    it 'returns the menu' do
      expect(subject.display).to eq(menu)
    end
  end
end
