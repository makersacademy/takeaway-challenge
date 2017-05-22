
require 'order'

describe Order do

  MENU_PRICE = { price: 10}

  subject(:order) { described_class.new(:dish, MENU_PRICE[:price]) }

  let(:new_dish) { double(:new_dish) }

  it 'checks current order' do
    expect(order.current_order).to eq ([{:dish => MENU_PRICE[:price] }])
  end

  it 'adds new dishes to the order' do
    expect { order.add(:new_dish, :price) }.to change { order.current_order.length }.by 1
  end

  it 'calculates current order total' do
    order.add(:dish, MENU_PRICE[:price])
    order.add(:dish, MENU_PRICE[:price])
    expect(order.order_total).to eq 30
  end

end
