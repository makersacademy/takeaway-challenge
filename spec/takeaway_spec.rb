require 'takeaway'

describe Takeaway do
  describe '@menu_hash' do

    let(:menu_hash) { { 'Mixed Starter' => 7, 'Yuk Sung' => 6.4, 'Prawn Cocktail' => 3.7 } }
    
    it 'returns a hash of food items and its price' do
      expect(subject.menu_hash).to eq(menu_hash)
    end
  end

  describe '#print_menu' do
    it 'prints out each item and price on a new line' do
      expect { subject.print_menu }.to output("Mixed Starter : £7.00\nYuk Sung : £6.40\nPrawn Cocktail : £3.70\n").to_stdout
    end
  end

end