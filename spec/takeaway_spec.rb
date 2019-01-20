require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let (:menu) { double(:menu, view: displayed_menu) }
  let (:order) { double(:order, total: 8.50) }
  let (:displayed_menu) { "Side: £2.50" }

  let (:dishes) { {starter: 2, main: 1} }

  it 'shows the menu with dishes and prices' do
    expect(takeaway.view_menu).to eq(displayed_menu)
  end

  it 'can place an order for some dishes' do
    expect(order).to receive(:add).twice
    takeaway.make_order(dishes)
  end

  it 'retruns the total cost of the order' do
    allow(order).to receive(:add)
    total = takeaway.make_order(dishes)
    expect(total).to eq(8.50)
  end
end
