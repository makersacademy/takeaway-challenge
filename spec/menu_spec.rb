require 'menu'

describe Menu do

  describe '#initialize' do
    it 'loads a menu instance variable with dishes' do
      expect(subject.menu).to eq Menu::DISHES
    end
  end

  describe '#index_to_item' do
    context 'when passed 3' do
      it 'returns cheeseburger' do
        expect(subject.index_to_item(3)).to eq 'Cheeseburger'
      end
    end
  end

  describe '#index_to_price' do
    context 'when passed 6' do
      it 'returns 1' do
        expect(subject.index_to_price(6)).to eq 1
      end
    end
  end

  #describe '#on_menu?' do
  #  context 'when given an item on the menu' do
  #    it 'returns true' do
  #      expect(subject.on_menu?("Chips")).to be true
  #    end
  #  end
  #  context 'when given an item not on the menu' do
  #    it 'returns false' do
  #      expect(subject.on_menu?("Test Item")).to be false
  #    end
  #  end
  #end
end
