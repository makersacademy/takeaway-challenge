require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:items) { menu.items }

  describe '#initialize' do
    it 'creates hash of menu items & prices' do
      expect(menu.items).not_to be_empty
    end
  end

  describe '#display' do
    it 'displays list of menu items & prices' do
      expect(menu.display).to eq items
    end
  end

  describe '#contains?' do
    it 'returns true when item is contained in @items hash' do
      expect(menu.contains?("peking duck")).to eq true
    end

    it 'returns false when item is not contained in @items hash' do
      expect(menu.contains?("porridge")).to eq false
    end
  end

  describe '#price' do
    it 'returns price of item' do
      expect(menu.price("peking duck")).to eq 7.99 
    end
  end

end
