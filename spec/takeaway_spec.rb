require 'takeaway'

describe Takeaway do

	let(:menu) {double(:menu)}
	let(:order) {double(:order)}
	let(:chow_mein) {double(:dish)}
	let(:pasta) {double(:dish)}

	subject(:takeaway) {described_class.new(menu)}

	it {is_expected.to respond_to(:place).with(1).argument}

	it 'initializes with an empty orders array' do
		expect(takeaway.orders).to eq []
	end

	it 'initializes with a menu' do
		expect(takeaway.menu).to eq(menu)
	end

	describe '#place' do
		before(:each) do
										allow(order).to receive(:food).and_return({chow_mein => 3, pasta => 2})
										allow(order).to receive(:phone_number).and_return(+447000000000)
									end
		it 'places an order' do
			takeaway.place(order)
			expect(takeaway.orders).to include(order.food)
		end

		it 'sends a text message to confirm order' do
			expect(takeaway.place(order)).to eq(takeaway.send_text(order.phone_number))
		end
	end

end