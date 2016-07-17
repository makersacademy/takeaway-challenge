require 'menu'

describe Menu do

  let(:menu) { described_class.new }
  let(:menu_item) do
      { :margherita => 6.5 }
    end

  describe '#items' do
    it 'should contain a list of the menu items' do
      expect(menu.menu_items).to include (menu_item)
    end
  end

  describe '#print_list' do
    it 'should print a list of menu_items and prices' do
      printed_menu = "Margherita: £6.50, Hawaiian: £6.70, Rustico: £6.80, Peperroni: £7.20, Carnivore: £8.10, Herbivore: £7.30, Quattro_stagioni: £7.20, Everything: £8.50"
      expect(menu.print_list).to eq(printed_menu)
    end
  end
end
