require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu_item) { double :dish, name: 'Taco', price: 2 }
  let(:menu_item2) { double :dish, name: 'Burrito', price: 3.20 }
  let(:messager) { double :messager }

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
     expect{ order.remove_dish(menu_item2) }.to raise_error(InvalidOptionError)
   end
 end

 describe '#review_order' do
   it 'lets you view basket at any point while ordering' do
     order.add_dish(menu_item)
     expect(order.review_order).to eq ({'Taco' => 1})
   end
 end

 describe '#total_price' do
   it 'calculates price total for dishes in basket' do
     order.add_dish(menu_item)
     order.add_dish(menu_item2)
     expect(order.order_total).to eq 5.20
   end
 end

 describe '#confirm_order' do
   it 'should raise error if order is empty at checkout' do
     expect { order.confirm_order }.to raise_error(EmptyBasketError)
   end
 end


 end
