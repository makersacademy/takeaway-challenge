require 'takeaway'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu, order) }
  let(:menu) { double :menu, list_menu: "Lists menu", items: { "Chips": 3.00 } }
  let(:order) { double :order, order_summary: "Chips", basket: [], total: 0 }

  it 'prints a menu' do
    expect(takeaway.print_menu).to eq menu.list_menu
  end

  it 'raises an error if selected item is not on menu' do
    expect { takeaway.add_to_order("Octopus") }.to raise_error "Item not on menu!"
  end

  it 'adds order' do
			takeaway.add_to_order("Chips")
			expect(takeaway.order_summary).to eq order.order_summary
	end

	it 'can add multiple items at once' do
		expect{takeaway.add_to_order("Chips", 2)}.to change {takeaway.order.basket.count}.by(2)
	end

	it 'adds the price of each item to the order total' do
		expect{takeaway.add_to_order("Chips")}.to change {takeaway.order.total}.by(3.00)
	end

end
