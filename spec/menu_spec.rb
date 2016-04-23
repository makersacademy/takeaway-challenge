require 'menu'

describe Menu do
  let(:dish) { (0...8).map { (65 + rand(26)).chr }.join }
  let(:dish2) { (0...8).map { (65 + rand(26)).chr }.join }
  let(:price) { rand(10) }
  subject(:menu) { described_class.new }

  describe '#view' do
    context 'empty menu' do
      it 'raises an error' do
        expect{ menu.view }.to raise_error(Menu::EMPTY_ERR)
      end
    end
  end

  describe '#add' do
    before { menu.add(dish, price) }
    it 'adds the dish to the menu' do
      expect(menu.view).to include(dish.upcase => price)
    end
    context 'adding a duplicate dish' do
      it 'raises an error' do
        expect{ menu.add(dish, price) }.to raise_error(Menu::DUPE_ERR)
      end
    end
  end

  describe '#remove' do
    context 'dish not on menu' do
      it 'raises an error' do
        expect{ menu.remove(dish) }.to raise_error(Menu::NO_DISH_ERR)
      end
    end
    context 'dish is on the menu' do
      before { menu.add(dish, price) ; menu.add(dish2, price) }
      it 'removes the item from the menu' do
        menu.remove(dish)
        expect(menu.view).not_to include(dish.upcase)
      end
    end
  end
end
