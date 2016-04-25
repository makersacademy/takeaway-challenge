
require 'takeaway'

describe Takeaway do 
	subject(:takeaway) {described_class.new(menu: menu, order: order) }
	let(:menu) {double :menu, show: printed_menu}
	let(:order) {double :order, order_total: 14.30}
	let(:dishes) {{ kurma: 4.80,  madras: 4.50, vindaloo: 5.00}}
	let(:printed_menu) {'Chicken Kurma: £4.80'}
	it 'shows the list of dishes with prices' do 
		expect(takeaway.print_menu).to eq(printed_menu) 
	end	

	it 'lets customer select number of dishes' do 
		expect(order).to receive(:add).exactly(3).times
		takeaway.select_order(dishes)

	end


	it 'gets the order total' do 
		allow(order).to receive(:add)
		total = takeaway.select_order(dishes)
		expect(total).to eq 14.30
	end

	context'#confirming order' 
 		it 'sends text to confirm order will be delivered on time' do 
			expect(takeaway.confirm_order).to eq message
		end

			private
		
			def message
				"delivery message"
			end

end
