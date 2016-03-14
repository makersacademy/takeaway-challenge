require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  before(:each) { menu.add(:Burger, 7.00) }

  describe '#add' do
    it 'adds dish to the menu' do
      expect(menu.display).to include Burger: 7.00
    end
  end

  describe '#remove' do
    it 'removes item from the menu' do
      expect(menu.remove(:Burger)).to eq 'Burger has been removed from the menu'
    end

    it 'does not remove unexisting item' do
      expect(menu.remove(:lobster)).to eq 'lobster is not on the menu'
    end
  end

  describe '#load_menu' do
    it 'loads menu from a file' do
      menu.load_menu
      expect(menu.display).to include pizza: 7.00
    end
  end

  describe '#display' do
    it 'displays the menu' do
      expect(menu.display).to eq Burger: 7.00
    end
  end

  describe '#cointains?' do
    it 'checks menu for existing item' do
      expect(menu.contains?(:Burger)).to be true
    end

    it 'checks menu for unexisting item' do
      expect(menu.contains?(:Pancake)).to be false
    end
  end

  describe '#price' do
    it 'displays the price of an item' do
      expect(menu.price(:Burger)).to be 7.00
    end
  end
end
