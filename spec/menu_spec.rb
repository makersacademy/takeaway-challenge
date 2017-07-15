require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#print' do

    it 'shows a list of dishes and prices' do
      expect { menu.print }.to output("1: Burger, £5.50\n").to_stdout
    end
  end

  describe '#selection' do
    it 'returns the ordered items' do
      numbers = [1]
    expect(menu.selection(numbers)).to eq [["Burger", 5.50]]
    end
  end

end
