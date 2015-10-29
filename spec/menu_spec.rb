require 'menu'
require 'formatter'

include Formatter

describe Menu do

  let(:dish_klass){ double(:dish_klass, new: dish) }
  let(:dish){ double(:dish, name: 'Burger', price: 5.99) }

  let(:file_klass){ double(:file_klass, open: file)}
  let(:line){ 'Burger,5.99' }
  let(:file){ double(:file) }

  subject(:menu){ Menu.new(dish_klass, file_klass) }

  before :each do
    line = 'Burger,5.99'
    allow(file).to receive(:gets).and_return(line, nil)
  end

  context '#formatted_dishes' do
    it 'returns a formatted list of dishes' do
      name = dish.name 
      price = pound_str(dish.price)
      expect(menu.formatted_dishes).to eq three_col_str('0',name,price)
    end
  end

  context '#dishes' do
    it 'returns the array of dishes' do
      expect(menu.dishes).to eq [dish]
    end
  end

end
