require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double :menu, list_menu: "Lists menu", items: { "Pizza": 7.00 }, get_price: 7.00 }
  let(:order) { double :order, order_summary: "Chips", basket: [], total: 0 }

  it 'prints a menu' do
    expect(takeaway.print_menu).to eq menu.list_menu
  end

  it 'raises an error if selected item is not on menu' do
    expect { takeaway.add_to_order("Octopus") }.to raise_error "Item not on menu!"
  end

  it 'adds order' do
    allow(menu.items).to receive(:has_key?).and_return(:true)
    allow(order).to receive(:add_to_basket).with("Pizza", 1)
    allow(order).to receive(:add_to_total).with(7.00, 1)
    takeaway.add_to_order("Pizza", 1)
    expect(takeaway.order_summary).to eq takeaway.order_summary
	end

	it 'can add multiple items at once' do
    allow(menu.items).to receive(:has_key?).and_return(true)
    allow(order).to receive(:add_to_basket).with("Pizza", 2)
    allow(order).to receive(:add_to_total).with(7.00, 2)
		expect { takeaway.add_to_order("Pizza", 2) }.to change { takeaway.basket.count }.by(2)
	end

	it 'adds the price of each item to the order total' do
    allow(menu.items).to receive(:has_key?).and_return(:true)
    allow(order).to receive(:add_to_basket).with("Pizza", 1)
    allow(order).to receive(:add_to_total).with(7.00, 1)
		expect { takeaway.add_to_order("Pizza", 1) }.to change { takeaway.total }.by(7.00)
	end

end
