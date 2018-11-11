require 'order'
require 'twilio-ruby'

RSpec.describe Order do
		let(:menu) { dishes = {
		'Gallo pinto/Fried cheese/meet' => 5.00,
		'Vigoron' => 6.00,
		'Chancho con yuca' => 4.4,
		'Baho' => 8.00,
		'Nacatamal' => 3.5,
		'Tajada con queso' => 2.5 
		}
	}
	let(:twilio) {double}
	subject(:order) { described_class.new(menu)}
	it 'Show the list of the dishes' do
		expect(order.list_dishes).to eq menu
	end

	describe '#add' do
		it 'Adding a various number of dishes to the order' do
			order.add('Nacatamal')
			order.add('Baho',2)
			expect(order.total_dishes).to eq({"Nacatamal" => 1, "Baho" => 2})
		end
	end

	describe '#check' do
		it 'Checking the total and total price of the order' do
			order.add('Nacatamal')
			order.add('Baho',2)
			expect(order.check).to eq "Nacatamal - 1 || Baho - 2 || Your total is 19.5 £"
		end

		# it 'Sending sms confirmation' do
		# 	order.add('Nacatamal')
		# 	order.add('Baho',2)
		# 	expect(order.check).to eq "Nacatamal - 1 || Baho - 2 || Your total is 19.5 £"
		# 	expect(twilio).to receive(:send_message).and_return("message sent")
		# 	order.send
		# end
	end
end