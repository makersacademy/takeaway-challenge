require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  describe '#print_menu' do
    specify { expect { menu.show_menu }.to output.to_stdout }
  end

  describe '#check_price' do
    it 'Returns price if item on menu' do
      expect(menu.check_price('Spring Roll')).to eq 0.99
    end
    it 'Raises error if item not on menu' do
      expect { menu.check_price('TV') }.to raise_error 'Item not on menu'
    end
  end

  describe '#calculate_total' do
    it 'Returns the item totals for a basket' do
      basket = { 'Spring roll' => 10, 'peking duck' => 1 }
      expected = [['Spring roll', 10, 9.90], ['peking duck', 1, 7.99]]
      expect(menu.calculate_subtotal(basket)).to eq expected
    end
  end
end
