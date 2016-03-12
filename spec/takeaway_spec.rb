require 'takeaway'


describe Takeaway do 
	subject(:takeaway) {described_class.new(list: list, order: order)}

	let(:list) { double(:list, display: displayed_list) }
	let(:order) {instance_double("order", total: 29.97)}
	let(:displayed_list) { "chicken_tandoori: 10" }
	let(:dishes) { {chicken_tandoori: 2, lamb_handi: 1} }

	it 'displays a list of dishes with prices' do
		expect(takeaway.display_list).to eq(displayed_list)	
	end

	it "allows you to choose the quantity of several dishes" do
		expect(order).to receive(:add).twice
		takeaway.place_order(dishes)
	end
		
end

