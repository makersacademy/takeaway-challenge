require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  describe '#list' do
    it 'will return a list of menu items in a hash'do
      expect(menu.list).to eq  pizza: 5, carbonara: 6
    end
    it 'returns a string to print out the menu list' do
      expect(menu.print_menu).to eq  "pizza - £5, carbonara - £6, "
    end
  end
end
