require 'menu'

describe Menu do
  subject(:menu) { described_class.new({ "Chicken Tika" => 5.00 }) }

  describe '#show_menu' do
    it 'will show the menu with prices' do
      expect(menu.show_menu).to eq({ "Chicken Tika" => 5.00 })
    end
  end

  describe '#price_of_dish' do
    it 'displays price of a selected dish' do
      expect(menu.price_of_dish("Chicken Tika")).to eq 5.00
    end
  end
end
