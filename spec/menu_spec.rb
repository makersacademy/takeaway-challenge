require 'menu'

describe Menu do
  let(:menu) { Menu.new }
  describe '#list' do
    it 'has a menu of dishes' do
      expect(menu.dishes).to eq([])
    end
    it 'prints the menu' do
      menu.add(:dish_name)
      expect(menu.list).to eq([:dish_name])
    end
  end
  describe '#add' do
    it 'can add a dish to the menu' do
      menu.add(:dish_name)
      expect(menu.dishes).to eq([:dish_name])
    end
  end
  describe '#remove' do
    it 'can remove a dish from the menu' do
      menu.add(:dish_name)
      menu.remove(:dish_name)
      expect(menu.dishes).to eq([])
    end
  end
end
