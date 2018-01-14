require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  describe '#read_menu' do
    it 'returns a menu' do
      menu = { spring_rolls: 1.99, prawn_toast: 1.99,
         egg_fried_rice: 2.50, kung_po_chicken: 4.50 }
      expect(restaurant.read_menu).to eq menu
    end
  end
end
