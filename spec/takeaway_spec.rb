require 'takeaway'

describe Takeaway do
	subject(:takeaway) {described_class.new(menu: menu)}
	let(:menu) { double(:menu, print: printed_menu) }
	let(:printed_menu) {"Pizza: £14.00"}

	it 'will show the menu' do
		expect(takeaway.show_menu).to eq(printed_menu)
	end
end