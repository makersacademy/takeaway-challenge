require 'takeaway'

describe Takeaway do
	subject(:takeaway) {described_class.new(menu: menu, order: order)}
	let(:menu) { double(:menu, print: printed_menu) }
	let(:printed_menu) {"Pizza: £14.00"}
	let(:dishes) {{pizza: 2, nuggets: 4}}
	let(:order) {double(:order)}

	it 'will show the menu' do
		expect(takeaway.show_menu).to eq(printed_menu)
	end

	it 'can select dishes to build an order' do
		expect(order).to receive(:add).twice
		expect(takeaway.selector(dishes))
	end
end