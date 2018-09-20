require './lib/menu'
describe Menu do

  let(:menu_printer) { double :menu_printer, display_menu: nil }
  subject(:menu) { described_class.new(menu_printer) }

  describe '#initialize' do
    it 'creates a menu with dishes and prices' do
      expect(menu.menu_list).to be_an_instance_of(Hash)
    end
    it 'contains dishes and prices' do
      expect(menu.menu_list[:coke]).to eq 2
    end
  end

  describe '#display_menu' do
    it 'should call the display_menu method on the menu printer' do
      expect(menu.menu_printer).to receive(:display_menu).with(anything)
      menu.display_menu
    end
  end

  describe '#dish_included?' do
    it 'returns true if a dish is in the menu' do
      expect(menu.dish_included?(:tortilla)).to eq true
    end
    it 'returns false if a dish is not in the menu' do
      expect(menu.dish_included?(:fanta)).to eq false
    end
  end

  describe '#dish_price' do
    it 'gives the price of a specific dish' do
      expect(menu.dish_price(:lasagna)).to eq 6
    end
  end
end
