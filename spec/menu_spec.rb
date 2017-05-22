require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:dish) { double :dish, name: 'wings', price: 7 }

  describe '#add_dish' do
    it 'adds a dish to the dishes list' do
      expect(menu.add_dish(dish)).to eq [dish]
    end
  end

  describe '#show_menu' do
    let(:dish2) { double :dish2, name: 'lamb', price: 5 }
    it 'show the dishes in the menu' do
      menu.add_dish(dish)
      menu.add_dish(dish2)
      expect(menu.show_menu).to eq('1. wings, £7.00, 2. lamb, £5.00')
    end
  end

  describe '#select_dish' do
    it 'allows to select a dish from the menu' do
      menu.add_dish(dish)
      expect(menu.select_dish('wings')).to eq dish
    end
  end

  describe '#contain_dish?' do
    it 'return false if a dish is not on the menu' do
      expect(menu.contain_dish?('wings')).to eq false
    end

    it 'return true if a dish is on the menu' do
      menu.add_dish(dish)
      expect(menu.contain_dish?('wings')).to eq true
    end
  end
end
