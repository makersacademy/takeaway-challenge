require 'order'

describe 'Order' do
	
	let(:coq_au_vin) {double :dish, name: "Coq au vin", price: 30 }
	let(:order) {Order.new}

	it 'should be empty when created' do
		expect(order.dishes).to be_empty
	end

end