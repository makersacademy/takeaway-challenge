require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class.new(menu: menu, order: order) }

  let (:menu) { double(:menu, view: displayed_menu) }
  let (:order) { double(:order) }
  let (:displayed_menu) { "Side: £2.50" }

  let (:dishes) { {starter: 2, main: 1} }

  it 'shows the menu with dishes and prices' do
    expect(takeaway.view_menu).to eq(displayed_menu)
  end

  it 'can place an order for some dishes' do
    expect(order).to receive(:add).twice
    takeaway.make_order(dishes)
  end
end
