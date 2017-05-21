require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:menu_item) { double :menu_item, name: 'Taco', price: 5 }

  it 'allows customer to start with an empty basket' do
    expect(order.basket).to be_empty
  end

  describe '#adds_dish' do
     it 'adds menu item to basket' do
       order.add_dish(menu_item)
       expect(order.basket).to eq ({menu_item => 1})
     end

     it 'allows customer to customise quantity of menu item in order' do
       order.add_dish(menu_item,4)
       expect(order.basket).to eq ({menu_item => 4})
     end
  end
end
