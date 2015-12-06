require 'menu'

describe Menu do
  subject(:menu) { described_class.new }

  it 'should initialize with an empty dishes list' do
    expect(menu.dishes).to be_empty
  end

  describe '#add_item' do
    it 'should add an item to the menu' do
      menu.add_item(:shrimp, 1.88)
      expect(menu.dishes).to include(shrimp: 1.88)
    end
  end

  context 'after the menu has been populated' do
    before(:example) do
      menu.add_item(:burger, 2.45)
      menu.add_item(:lamb, 3.45)
      menu.add_item(:fries, 1.45)
    end

    describe '#remove_item' do
      it 'should remove an item from the menu' do
        menu.remove_item(:burger)
        expect(menu.dishes).not_to include(burger: 2.45)
      end
    end

    describe '#includes?' do
      it 'should return true if an item is on menu' do
        expect(menu.includes?(:burger)).to be true
      end

      it 'should return false if an item is not on menu' do
        expect(menu.includes?(:dinosaur)).to be false
      end
    end
  end

end
