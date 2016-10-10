require 'order'
require 'basket'

describe Order do
  subject(:order) {described_class.new}

  it 'initialises an order' do
    expect(order).to be_a_kind_of(Order)
  end

  it 'should initialize with a basket' do
    expect(order.basket).to be_a_kind_of(Basket)
  end

  # it 'should show the menu' do
  #   expect(order.view_menu).to eq(@menu)
  # end
#
context 'Adding to the basket' do
  before do
    order.add_dish(1,2)
  end

  it 'should add the item and quantity to basket' do
    expect(order.basket.basket).to eq([{item: 'Margherita', quantity: 2, cost: 8}])
  end

  it 'should raise an error if the item number does not exist' do
    expect{order.add_dish(19,2)}.to raise_error("Sorry that dish isn't available")
  end

  it 'should show the current order' do
    expect(STDOUT).to receive(:puts).with("2x Margherita : £8")
    order.show_order
  end

  it 'should show the total price' do
    expect(STDOUT).to receive(:puts).with("Your total is £16")
    order.total_price
  end
end

end
