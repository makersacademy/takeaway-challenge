require 'order'

describe Order do
	let(:order){Order.new}
	let(:coq_au_vin){double :dish, name: "Coq au vin", price: 30}

	it 'should be empty when created' do
		expect(order.dishes).to be_empty
	end

	it 'should be able to add a dish and specify the quantity' do
		order.selection(coq_au_vin, 3)
		expect(order.dishes).to eq([coq_au_vin, coq_au_vin, coq_au_vin])
	end

	it 'should be able to sum the total price' do
		order.selection(coq_au_vin, 3)
		expect(order.total_order).to eq(90)
	end

end
