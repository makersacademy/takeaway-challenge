require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  before(:each) { menu.add(:Burger, 7.00) }
  describe '#add' do
    it 'adds something to the menu' do
      expect(menu.display).to include Burger: 7.00
    end
  end

  describe '#remove' do
    it 'removes item from the menu' do
      menu.remove(:Burger)
      expect(menu.display).not_to include Burger: 7.00
    end
  end

  describe '#load_menu' do ## fix this test later
    it 'loads a menu' do
      menu.load_menu(Pizza: 6.00)
      expect(menu.display).to include Pizza: 6.00
    end
  end

  describe '#display' do
    it 'displays the menu' do
      expect(menu.display).to eq Burger: 7.00
    end
  end
end
