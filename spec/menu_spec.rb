require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#show_menu' do
    it 'should return list of dishes with prices' do
      expect(subject.show_menu).to eq("Egg fried rice : £2
Special fried rice : £2
Prawn toast : £2
Chicken balls : £2.5
Spring rolls : £2.5
Char siu pork : £3
Beef chow mein : £3.5
Spare ribs : £3.5")
    end
  end
end
