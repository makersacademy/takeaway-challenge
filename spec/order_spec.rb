require 'order'
require 'menu'

describe Order do

  dish1 = Dish.new('Fried chicken', 4)
  dish2 = Dish.new('Rice Bowl', 3)

  test_menu = Menu.new([dish1, dish2])

  subject { Order.new(:menu => test_menu) }

  it 'initialize with a empty basket' do
    expect(subject.my_basket).to be_empty
  end

  it 'initialize with total price of 0' do
    expect(subject.total).to eq 0
  end

  describe '#Add_item' do

    it 'adds dishes to basket' do
      subject.add_item(dish1, 1)
      subject.add_item(dish2, 2)
      expect(subject.my_basket).to eq({dish1 => 1, dish2 => 2})
    end

    it 'raises error if a dish is not in the menu' do
      dish3 = Dish.new("Black beans", 4)
      expect { subject.add_item(dish3, 1) }.to raise_error Order::ERROR_DISH
    end

    it 'increases the amount when a dish that has been added before is added' do
      subject.add_item(dish1, 2)
      subject.add_item(dish1, 1)
      expect(subject.my_basket[dish1]).to eq 3
    end

  end


end
