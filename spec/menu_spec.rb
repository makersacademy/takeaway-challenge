require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#show' do
    it 'shows a list of available dishes with prices' do
      expect(menu.show).to include{'Classic Fondue : £13.0'}
    end
  end

  describe '#available?' do
    it 'checks if a dish is available' do
      expect(menu.available?('Special Fondue')).to be true
    end
    it 'returns false if a dish is not available' do
      expect(menu.available?('Chicken')).to be false
    end
  end

  describe '#price' do
    it 'calculates price of a dish' do
      expect(menu.price('Classic Fondue')).to eq(13.0)
    end
  end 

end
