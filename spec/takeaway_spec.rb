require 'takeaway'

describe Takeaway do  

	subject(:takeaway) {described_class.new(menu: menu, order: order, sms: sms, config: {})} #injecting menu class to allow amy menu methods to be handled in menu class (Order doesn't need to know!) - ## ?? ## Role of value menu?  Doesn't work without, but unsure of role...
	
	let(:menu) {double(:menu, print: printed_menu)} #verifying doubles...?!  skipped this step (for now...)
	let(:order) {double(:order, total: 15.50)}  #why hardwiring number in here?!
	let(:sms) {double(:sms, deliver: nil)}
	let(:printed_menu) {"chicken: £3.50"}
	let(:dishes) {{chicken: 2, fish: 1}}

	it {is_expected.to respond_to(:print_menu)} #instance of Order to respond to Order's print_menu method.
	it {is_expected.to respond_to(:place_order)}
	# it {is_expected.to respond_to(:total)}


	before do
		allow(order).to receive(:add)
	end

	it 'shows the menu with dishes and prices' do
		expect(takeaway.print_menu).to eq(printed_menu)  #checking dependency injection of other class's method is working
	end

	it 'can order some number of several available dishes' do
		expect(order).to receive(:add).twice  
		takeaway.place_order(dishes)
	end

	it 'knows the order total' do
		total = takeaway.place_order(dishes)
		expect(total).to eq(15.50)
	end

	it 'sends an SMS when order has been placed' do
		expect(sms).to receive(:deliver)
		takeaway.place_order(dishes)
	end
end