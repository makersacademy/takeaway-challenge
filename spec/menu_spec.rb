require 'menu'

describe Menu do
  subject(:menu) { described_class.new(dishes) }

  let(:dishes) do { Dosa: 7.95, Chapatti: 2.70 } end
  let(:shown_menu) { 'Dosa - £7.95, Chapatti - £2.70' }

  it 'has a list of dishes and their prices' do
    expect(menu.dishes).to eq dishes
  end

  describe '#show' do
    it 'returns a list of menu items and their prices' do
      expect(menu.show).to eq shown_menu
    end
  end

  describe '#includes_dish?' do
    it 'returns true if dish is on the menu' do
      expect(subject.includes_dish?('Dosa')).to eq true
    end
    it 'returns false if dish is not on the menu' do
      expect(subject.includes_dish?('Pizza')).to eq false
    end
  end
  describe '#price' do
    it 'return the price of the dish' do
      expect(subject.price('Dosa')).to eq 7.95
    end
  end
end
