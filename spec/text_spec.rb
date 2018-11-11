require 'text'

describe Text do
	let(:dish1) {double("chicken", :name => "chicken", :price => 1.99)}
	let(:dish2) {double("wings", :name => "wings", :price => 2.99)}
	let(:total_price) {dish1.price + dish2.price}
	
	before do
		allow(subject).to receive(:send_message)
	end

	it 'sends an order confirmation with total price' do
		expect(subject).to receive(:send_message).with(dish1.price + dish2.price)
		subject.send_message(total_price)
	end
end