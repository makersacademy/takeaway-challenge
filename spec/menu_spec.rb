require 'menu'

describe Menu do
subject(:menu) {described_class.new}

  it 'is a menu class' do
    expect(menu).to be_a Menu
  end

  describe '#add' do
    it 'adds menu items and their prices to a hash' do
      menu.add("chicken", 15.50)
      expect(menu.menu_list).to eq ({"chicken" => 15.50})
    end
  end

  describe '#menu_list' do
    it 'displays a list of current menu items and their prices' do
      menu.add("chicken", 15.50)
      expect(menu.menu_list).to eq ({"chicken" => 15.50})
    end
  end
end