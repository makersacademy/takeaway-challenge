require 'order'

describe Order do

let(:menu_item1) {double :menu_item1, name: "Curry", price: 5}
let(:menu_item2) {double :menu_item2, name: "Burger", price: 6}


  it 'allows me to choose an item from the menu' do
    subject.add_menu_item_to_order(menu_item1)
    expect(subject.order.count).to eql(1)

  end

  it 'Allows me to select some number of dishes' do
    subject.add_menu_item_to_order(menu_item1)
    subject.add_menu_item_to_order(menu_item2)
    subject.add_menu_item_to_order(menu_item1)
    subject.add_menu_item_to_order(menu_item2)
    expect(subject.total_dishes).to eq(4)

  end

  it 'allows me to check the total price of all the dishes I have added' do
    subject.add_menu_item_to_order(menu_item1,2)
    subject.add_menu_item_to_order(menu_item2)
    expect(subject.total).to eq(16)
  end






end
