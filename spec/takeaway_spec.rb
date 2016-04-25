require 'takeaway'

describe Takeaway do
	subject(:takeaway){described_class.new(menu:menu, order:order, sms:sms, config:{})}
	let(:menu) { double(:menu, display:display_menu) }
	let(:display_menu) {"List of dishes"}
	let(:number_dishes) { {jajangmyun: 1, bibimbap: 2} }
	let(:order) { double(:order) }
	let(:sms) { spy(:sms, send: nil) }

	it 'shows a list of dishes with prices' do
		expect(takeaway.display_menu).to eq display_menu
	end

	it 'receive the order total' do #why do i need to test this again?
		allow(order).to receive(:log) 
		allow(order).to receive(:total).and_return("Your total is £27.00")
		expect(takeaway.order_dishes(number_dishes)).to eq("Your total is £27.00")
	end	

	it 'sends a msg when the order is placed' do #same with this
		allow(order).to receive(:log)
		allow(order).to receive(:total).and_return("Your total is £27.00")
		takeaway.order_dishes(number_dishes)
		expect(sms).to have_received(:send)
	end
end