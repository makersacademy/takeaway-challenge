
require 'takeaway'

describe Takeaway do 
	subject(:takeaway) {described_class.new(menu: menu, order: order) }
	let(:menu) {double :menu, show: printed_menu}
	let(:order) {double :order}
	let(:dishes) {{ kurma: 4.80,  madras: 4.50, vindaloo: 5.00}}
	let(:printed_menu) {'Chicken Kurma: £4.80'}
	it 'shows the list of dishes with prices' do 
		expect(takeaway.print_menu).to eq(printed_menu) 
	end	

	it 'lets customer select number of dishes' do 
		expect(order).to receive(:add).exactly(3).times
		takeaway.select_order(dishes)

	end


end
