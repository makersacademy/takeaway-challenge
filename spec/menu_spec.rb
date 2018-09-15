require 'menu'

describe Menu do
  let(:menu) { described_class.new }
  let(:dish) { double :dish, name: 'pizza', price: 5 }

  context '#add_dish' do
    it 'add hash to dishes array' do
      menu.add_dish(dish)
      expect(menu.dishes).to include({ name: dish.name, price: dish.price })
    end
  end
end
