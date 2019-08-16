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
  it 'can add to basket' do
    dish_name = 'Foo soup'
    dish = double(:dish)
    allow(basket).to receive(:add)
    allow(order).to receive(:order).and_return([dish])
    expect(order.order).to receive(:each).and_yield(dish)
    subject.add_to_basket(menu, dish_name, 1)
  end
  it 'raises an error if item not on menu' do
    dish_name = 'Foobar lasagne'
    allow(order).to receive(:order).and_return(nil)
    expect { subject.add_to_basket(menu, dish_name, 1) }.to raise_error("Dish isn't on menu")
  end
  it 'prints dishes in the basket' do
    allow(basket).to receive(:list).and_return("Foo soup: 1\/Bar stew: 5")
    expect(subject.show_basket).to eq("Foo soup: 1\/Bar stew: 5")
  end
  context 'checkout, placing order' do
    it 'raises an error if the basket is empty' do
      allow(basket).to receive(:dishes).and_return([])
      expect { subject.checkout(0) }.to raise_error(CheckoutError, 'Basket empty')
    end
    it 'raises an error if the amount is wrong' do
      dish = double(:dish)
      allow(basket).to receive(:dishes).and_return([dish])
      allow(basket).to receive(:total).and_return(2)
      expect { subject.checkout(1) }.to raise_error(CheckoutError, 'Incorrect amount')
    end
    xit 'can send a confirmation text' do
    end
    xit 'empties the basket after checkout' do
    end
  end
end
