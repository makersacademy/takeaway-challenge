require 'menu'

describe Menu do
  subject(:menu) { described_class.new }
  let(:fish) { Dish.new(:Cod,14.99) }
  let(:steak) { Dish.new(:Steak,24.99) }

  describe 'class methods' do
    it { is_expected.to(respond_to(:menu_items)) }
    it { is_expected.to(respond_to(:add_dish)) }
  end

  describe '#add_dish' do
    it 'should add a dish to menu' do
      menu.add_dish(fish)
      expect(menu.menu_items).to have_key(fish.name)
      expect(menu.menu_items).to have_value(fish.price)
    end
  end

  describe '#menu_items' do
    it 'should show items on menu' do
      menu.add_dish(fish)
      menu.add_dish(steak)
      expect(menu.menu_items).to include(fish.name => fish.price, steak.name => steak.price)
    end
  end
end
