require 'takeaway'

RSpec.describe Takeaway do
  let(:order) { double :order, add: 'Added to Basket', items: order_spec, total: 27.15 }
  subject(:takeaway) { described_class.new(menu, order) }

  let(:menu) { double :menu, dishes: menu_items, print_menu: printed_menu }
  let(:menu_items) { { "Classic Chicken": 9.95 } }
  let(:printed_menu) { "Classic Chicken £9.95" }
  let(:order_spec) { { "Classic Chicken": 2 } }

  it 'prints the menu' do
    expect(takeaway.print_menu).to eq printed_menu
  end

  it 'accepts an order' do
    expect(takeaway.add_to_basket(order_spec)).to eq 'Added to Basket'
  end

  it 'stores the order' do
    expect(takeaway.basket).to eq order_spec
  end

  it 'returns the sum of the basket' do
    expect(takeaway.total).to eq 27.15
  end
end
