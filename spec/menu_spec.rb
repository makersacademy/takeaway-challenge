require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should initialize with an empty menu_list' do
    expect(menu.list).to be_empty
  end

  describe '#add_item' do
    it 'should add an item to the menu' do
      menu.add_item(:shrimp, 1.88)
      expect(menu.list).to include(shrimp: 1.88)
    end
  end

  describe '#remove_item' do
    it 'should remove an item from the menu' do
      menu.add_item(:burger, 2.45)
      menu.remove_item(:burger)
      expect(menu.list).not_to include(burger: 2.45)
    end
  end



end
