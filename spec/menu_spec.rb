require 'menu'

describe Menu do

  subject(:menu) { described_class.new }
  let(:dish1) { double :dish, name: 'Pizza', price: 8 }
  let(:dish2) { double :dish, name: 'Cheeseburger', price: 6 }

  describe '#initialize'do

    it 'initializes with no dishes' do
      expect(menu.available_dishes).to be_empty 
    end

  end

  # add(dish_name, quantity = 1)
  describe '#add_item' do
    
    it 'adds a dish with default quantity of 1' do
      menu.add_item(dish1)
      expect(menu.available_dishes).to include dish1
    end

  end

  # print
  # remove(dish)

end