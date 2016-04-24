require 'menu'

describe Menu do
  let(:rand_string) { (0...8).map { (65 + rand(26)).chr }.join }
  let(:dish_class) { double(:dish_class) }
  let(:dish) { double(:dish, name: rand_string) }
  let(:dish2) { double(:dish, name: rand_string.reverse) }
  let(:price) { rand(10) }
  subject(:menu) { described_class.new }

  describe '#initialize' do
    subject(:menu_class) { described_class }
    it 'is initialized with 1 argument' do
      expect(menu_class.new(dish_class)).to be_a menu_class
    end
    it 'has an optional argument' do
      expect(menu_class.new).to be_a menu_class
    end
  end

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
      expect(menu.view).to include(dish.name => price)
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
        expect(menu.view).not_to include(dish.name)
      end
    end
  end
end
