require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu) }
  let(:basket) { double(:basket) }
  let(:platform) { double(:platform) }
  let(:platform_class) { double(:platform_class, new: platform) }
  let(:confirmation) { double(:confirmation) }
  let(:confirmation_class) { double(:confirmation_class, new: confirmation) }
  let(:order) { double(:order) }
  let(:order_class) { double(:order_class, new: order) }
  subject(:subject) { described_class.new(menu, basket, platform_class, confirmation_class, order_class) }

  it 'shows the menu' do
    allow(menu).to receive(:list).and_return("Foo soup: 1\/Bar stew: 5")
    expect(subject.show_menu).to eq("Foo soup: 1\/Bar stew: 5")
  end
  it 'can add to basket' do
    dish_name = 'Foo soup'
    dish = double(:dish)
    allow(order).to receive(:valid?).and_return(true)
    allow(order).to receive(:name).and_return('Foo soup')
    allow(basket).to receive(:add)
    expect(basket).to receive(:add)
    subject.add_to_basket(dish_name, 1)
  end
  it 'raises an error if item not on menu' do
    dish_name = 'Foobar lasagne'
    allow(order).to receive(:valid?).and_return(false)
    expect { subject.add_to_basket(dish_name, 1) }.to raise_error("Dish isn't on menu")
  end
  it 'shows the basket' do
    allow(basket).to receive(:list).and_return("Foo soup: 1\/Bar stew: 5")
    expect(subject.view_basket).to eq("Foo soup: 1\/Bar stew: 5")
  end
  context 'checkout, placing order' do
    it 'raises an error if the basket is empty' do
      allow(basket).to receive(:empty?).and_return(true)
      expect { subject.checkout(0) }.to raise_error(CheckoutError, 'Basket empty')
    end
    it 'raises an error if the amount is wrong' do
      dish = double(:dish)
      allow(basket).to receive(:empty?).and_return(false)
      allow(basket).to receive(:total).and_return(2)
      expect { subject.checkout(1) }.to raise_error(CheckoutError, 'Incorrect amount')
    end
    it 'shows a subtotal' do
      allow(basket).to receive(:empty?).and_return(false)
      expect(basket).to receive(:print_total)
      subject.subtotal
    end
    xit 'can send a confirmation text' do
    end
    it 'empties the basket after checkout' do
      dish = double(:dish)
      allow(basket).to receive(:empty?).and_return(false)
      allow(basket).to receive(:total).and_return(2)
      allow(platform).to receive(:send)
      allow(confirmation).to receive(:message)
      expect(basket).to receive(:empty)
      subject.checkout(2)
    end
  end
end
