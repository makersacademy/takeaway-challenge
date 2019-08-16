require 'user_interface'

describe UserInterface do
  let(:menu) { double(:menu) }
  let(:basket_class) { double(:basket_class, new: basket) }
  let(:basket) { double(:basket, dishes: Array.new) }
  let(:platform_class) { double(:platform_class) }
  let(:confirmation_class) { double(:confirmation_class) }
  let(:order) { double(:order) }
  let(:order_class) { double(:order_class, new: order) }
  subject(:subject) { described_class.new(basket_class, platform_class, confirmation_class, order_class) }
  it 'shows the menu' do
    allow(menu).to receive(:list).and_return("Foo soup: 1\/Bar stew: 5")
    expect(subject.show_menu(menu)).to eq("Foo soup: 1\/Bar stew: 5")
  end
  xit 'can add to basket' do
    dish_name = 'Foo soup'
    dish = double(:dish)
    allow(order).to receive(:order).and_return([dish])
    allow(order).to receive(:each).and_yield(dish)
    subject.add_to_basket(menu, dish_name, 1, order_class)
    expect(subject.basket).to include(dish)
  end
  it 'raises an error if item not on menu' do
    dish_name = 'Foobar lasagne'
    dish = double(:dish)
    allow(order).to receive(:order).and_return(nil)
    expect { subject.add_to_basket(menu, dish_name, 1) }.to raise_error("Dish isn't on menu")
  end
  xit 'can checkout, placing order' do
  end
  xit 'can send a confirmation text' do
  end
end
