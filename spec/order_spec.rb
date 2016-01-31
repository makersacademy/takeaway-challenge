require 'order'


describe Order do 
	subject(:order) {described_class.new(list: list)}

	let(:list) { double(:list, display: displayed_list) }
	let(:displayed_list) { "chicken_tandoori: 10" }


	it 'displays a list of dishes with prices' do
		expect(order.display_list).to eq(displayed_list)	
	end


end

