require 'user_interface'

describe UserInterface do
  it 'shows the menu' do
    menu = double(:menu)
    allow(menu).to receive(:list).and_return("Foo soup: 1\/Bar stew: 5")
    expect(subject.show_menu(menu)).to eq("Foo soup: 1\/Bar stew: 5")
  end
  it 'can add to basket' do
    menu = double(:menu)
    dish_name = 'Foo soup'
    dish = double(:dish)
    order = double(:order, order: [dish])
    order_class = double(:order_class, new: order)
    allow(order).to receive(:each).and_yield(dish)
    subject.add_to_basket(menu, dish_name, 1, order_class)
    expect(subject.basket).to include(dish)
  end
  it 'raises an error if item not on menu' do
  end
  xit 'can checkout, placing order' do
  end
  xit 'can send a confirmation text' do
  end
end
