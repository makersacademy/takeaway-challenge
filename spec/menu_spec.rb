require 'menu'

describe Menu do

  subject(:menu) { described_class.new }

  describe '#print' do

    it 'shows a list of dishes and prices' do
      expect { menu.print }.to output("1: Burger, £5.50\n2: Pizza, £5.00\n").to_stdout
    end
  end

  describe '#selection' do
    let(:valid_order) { [1, 1] }

    it 'returns the ordered items and number ordered as hash' do
      this_order = { ["Burger", 5.50] => 2 }
      expect(menu.selection(valid_order)).to eq this_order
    end

    context 'when a non-existend order number is entered' do
      it 'raises an error' do
        numbers = [5]
        expect { menu.selection(numbers) }.to raise_error "Number 5 is not a valid dish"
      end
    end

  end

end
