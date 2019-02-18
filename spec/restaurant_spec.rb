require 'restaurant'

describe Restaurant do
  PRICE = 10
  let(:item1) { double :dish, name: 'Taco', price: 5 }
  let(:item2) { double :dish, name: 'Burrito', price: 6 }
  let(:menu) { double :menu, dishes: [item1] }
  let(:order) { double :order, basket: Hash.new(0) }
  subject(:restaurant) { described_class.new(menu, order) }

  it 'should display menu' do
    allow(menu).to receive(:show_menu) { menu.dishes }
    expect(restaurant.view_menu).to eq [item1]
  end

  it 'should show order summary' do
    allow(order).to receive(:review_order) { order.basket }
    expect(restaurant.order_summary).to eq(order.basket)
  end

  describe '#add_order' do

  it 'should add item to #current_order' do
    allow(order).to receive(:add_dish) { order.basket[item1] += 1 }
    expect(restaurant.add_order(1, 1)).to eq 1
  end

  it 'should raise error if item not available on menu' do
    allow(order).to receive(:add_dish) { order.basket[item2] += 1 }
    expect{ restaurant.add_order(2, 1) }.to raise_error(InvalidOptionError)
  end
end

  it 'should remove item from #current_order' do
    allow(menu).to receive(:new) { menu }
    allow(order).to receive(:new) { order }
    allow(order).to receive(:add_dish) { order.basket[item2] += 4 }
    allow(order).to receive(:remove_dish) { order.basket[item2] -= 2 }
    expect(restaurant.remove_order(1, 2)).to eq -2
  end

end
