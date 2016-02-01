require 'takeaway'

describe Takeaway do  

	subject(:takeaway) {described_class.new(menu: menu, order: order)} #injecting menu class to allow amy menu methods to be handled in menu class (Order doesn't need to know!) - ## ?? ## Role of value menu?  Doesn't work without, but unsurr of role...
	
	let(:menu) {double(:menu, print: printed_menu)} #:menu is the class, print: is the method within the menu class, setting to new var printed_menu so can access other class's method (i.e print) below
	let(:order) {double(:order)}
	let(:printed_menu) {"chicken: £3.50"}
	let(:dishes) {{chicken: 2, fish: 1}}

	it {is_expected.to respond_to(:print_menu)} #instance of Order to respond to Order's print_menu method.
	# it {is_expected.to respond_to(:select)}
	# it {is_expected.to respond_to(:total)}
	# it {is_expected.to respond_to(:text)}

	it 'shows the menu with dishes and prices' do
		expect(takeaway.print_menu).to eq(printed_menu)  #checking dependency injection of other class's method is working
	end

	it 'can order some number of several available dishes' do
		expect(order).to receive(:add).twice  
		takeaway.place_order(dishes)
	end
end