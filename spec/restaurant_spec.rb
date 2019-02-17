require 'restaurant'

describe Restaurant do
  let(:item1) { double :dish, name: 'Taco', price: 5 }
  let(:item2) { double :dish, name: 'Burrito', price: 6 }
  let(:menu) { double :menu, dishes: [item1] }
  let(:order) { double :order, basket: Hash.new(0) }
  subject(:restaurant) { described_class.new(menu, order) }

  it { is_expected.to respond_to(:view_menu) }

  it 'should display menu' do
    allow(menu).to receive(:new) { menu }
    allow(menu).to receive(:show_menu) { menu.dishes }
    expect(restaurant.view_menu).to eq [item1]
  end

  it 'should add item to #current_order' do
    allow(menu).to receive(:new) { menu }
    allow(order).to receive(:new) { order }
    allow(order).to receive(:add_dish) { order.basket[item2] += 1 }
    expect(restaurant.add_order(item2, 1)).to eq 1
  end

  it 'should remove item from #current_order' do
    allow(menu).to receive(:new) { menu }
    allow(order).to receive(:new) { order }
    allow(order).to receive(:add_dish) { order.basket[item2] += 4 }
    allow(order).to receive(:remove_dish) { order.basket[item2] -= 2 }
    expect(restaurant.remove_order(item2,2)).to eq -2
  end

  it 'should show order summary' do
    allow(menu).to receive(:new) { menu }
    allow(order).to receive(:new) { order }
    allow(order).to receive(:review_order) { order.basket }
    expect(restaurant.order_summary).to eq(order.basket)
  end
end
