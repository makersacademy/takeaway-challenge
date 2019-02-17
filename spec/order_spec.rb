require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu_item) { double :dish, price: 2 }
  let(:menu_item2) { double :dish, price: 3.20 }

  it 'allows customer to start with an empty basket' do
    expect(order.basket).to be_empty
  end

describe '#add_dish' do
  it 'adds menu item to basket' do
    order.add_dish(menu_item)
    expect(order.basket).to eq ({ menu_item => 1 })
  end

  it 'allows customer to customize quantity of menu item in order' do
    order.add_dish(menu_item, 4)
    expect(order.basket).to eq ({ menu_item => 4 })
  end
end

 describe '#remove_dish' do
   before { order.add_dish(menu_item) }
   it 'removes menu item from basket' do
     order.remove_dish(menu_item)
     expect(order.basket).to eq ({ menu_item => 0 })
   end

   it 'can only remove menu items which have been added to basket' do
     expect{ order.remove_dish(menu_item2) }.to raise_error("Not in basket")
   end
 end

  describe '#order_total' do
    it 'calculates price total for dishes in basket' do
      order.add_dish(menu_item)
      order.add_dish(menu_item2)
      expect(order.order_total).to eq 5.20
    end
  end
 end
