require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#print' do

    it 'shows a list of dishes and prices' do
      expect { menu.print }.to output("1: Burger, £5.50\n2: Pizza, £5.00\n").to_stdout
    end
  end

  describe '#selection' do
    it 'returns the ordered items and number ordered as hash' do
      numbers = [1, 1]
      this_order = { ["Burger", 5.50] => 2 }
      expect(menu.selection(numbers)).to eq this_order
    end
  end

end
