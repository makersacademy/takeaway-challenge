require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let (:dish) { double :dish }

  describe '#read_menu' do
    it 'reads the file' do
      allow(CSV).to receive(:read).with('dishes.csv') { [['Parmigiana di meanzane', '7.95']] }
      expect(CSV).to receive(:read).with('dishes.csv')
      menu.read_menu('dishes.csv')
    end
  end

  describe '#has_dish?' do
    it 'checks if a dish is in the menu' do
      allow(CSV).to receive(:read).with('dishes.csv') { [['Tiramisu', '4.50']] }
      menu.read_menu('dishes.csv')
      expect(menu.has_dish?('Tiramisu')).to eq true
    end
  end

  describe '#dish_price' do
    it 'gives the price of the selected dish if it is available' do
      allow(CSV).to receive(:read).with('dishes.csv') { [['Tiramisu', '4.50']] }
      menu.read_menu('dishes.csv')
      expect(menu.dish_price('Tiramisu')).to eq 4.50
    end
  end
end
