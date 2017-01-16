require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new }

  name = 'test'
  price = 5

  describe '#add_dish' do
    it 'adds a dish to the dishes array' do
      expect { restaurant.add_dish(name, price) }.to change { restaurant.menu.dishes.length }.by 1
    end
  end

  describe '#dishes' do
    it 'can display the dishes at a certain restaurant' do
      expect(restaurant.display).to include(Dish)
    end
  end

  describe '#create_new_menu' do
    it 'can create a new menu with a name' do
      expect(restaurant.create_new_menu('test')).to eq('test')
    end
  end
end
