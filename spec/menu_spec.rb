require 'meal'

describe Menu do
  subject(:menu) { described_class.new(Dish) }

  name = 'test'
  price = 5

  describe '#default_dishes' do
    it 'checks a restaurant is initialized with a default set of dishes' do
      expect(menu.dishes[0].name).to include('chicken_tikka')
    end
  end

  describe '#add_dish' do
    it 'adds a dish to the dishes array' do
      expect { menu.add_dish(name, price) }.to change{menu.dishes.length}.by 1
    end
  end
end
