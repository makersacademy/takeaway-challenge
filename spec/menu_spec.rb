require './lib/menu.rb'

describe Menu do

  describe '#printer' do
    it 'prints a menu' do
      expect(subject.printer).to eq([
        "Peking duck: £9.90",
      "Crispy chili Beef: £6.90",
      "Black bean sauce green pepper: £6.90",
      "Prawn spring rolls: £3.90",
      "Sesame prawn toast: £5.90",
      "Chicken balls (large): £5.90",
      "Chicken balls (small): £3.90",
      "Crispy Seaweed: £4.90",
      "Special fried rice: £4.90",
      "Egg fried rice: £3.40",
      "Rice: £2.90",
      "Hoisin sauce: £1.40",
      "Szechuan sauce: £1.40"
    ])
    end
  end
  describe '#prices' do
    it 'returns the price of a dish' do
      expect(subject.prices('Peking duck')).to eq(9.9)
    end
  end
end
