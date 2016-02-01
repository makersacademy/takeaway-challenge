require 'order'

describe Order do  

	subject(:order) {described_class.new(menu: menu)} #injecting menu to allo method to be handled in new class menu (Order doesn't need to know!)
	
	let(:menu) {double(:menu, print: printed_menu)}
	let(:printed_menu) {"chicken: £3.50"}

	it {is_expected.to respond_to(:print_menu)}
	# it {is_expected.to respond_to(:select)}
	# it {is_expected.to respond_to(:total)}
	# it {is_expected.to respond_to(:text)}

	it 'shows the menu with dishes and prices' do
		expect(order.print_menu).to eq(printed_menu)  #to return a print out of menu - test a specific item on menu!
	end
end

