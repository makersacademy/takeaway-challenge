require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dishes) { double :dishes }

  describe '#initialize' do
    it 'checks it confirms if an item is on the menu' do
      expect(menu.menu_items).to include({"squid" => 5})
    end
  end
  describe '#display' do
    it 'prints the menu' do
      test_menu = "tori: £6, squid: £5, pork: £8, ginger: £11, king: £12, chicken: £10"
      expect(menu.display).to eq(test_menu)
    end
  end
end