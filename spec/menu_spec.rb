require 'menu'

RSpec.describe Menu do
  describe '#menu' do
    it 'returns a list of dishes and prices' do
      expect(subject.menu).to include({ dish: 'Margherita', price: 8.45 })
    end
  end

  describe '#select' do
    it 'returns a single selected dish' do
      expect(subject.select('Margherita')).to eq({ dish: 'Margherita', price: 8.45 })
    end
  end
end
