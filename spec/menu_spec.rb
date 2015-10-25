require 'menu'
require 'formatter'

include Formatter

describe Menu do

  let(:dish_klass){ double(:dish_klass, new: dish) }
  let(:dishes_str){ "Burger,5.99/" }
  let(:dish){ double(:dish, name: 'Burger', price: 5.99) }

  subject(:menu){ Menu.new(dish_klass, dishes_str) }

  context '#formatted_dishes' do
    it 'returns a formatted list of dishes' do
      name, price = dish.name, dish.price.to_s
      expect(menu.formatted_dishes).to eq three_col_str('0',name,price)
    end
  end

  context '#dishes' do
    it 'returns the array of dishes' do
      expect(menu.dishes).to eq [dish]
    end
  end

end
