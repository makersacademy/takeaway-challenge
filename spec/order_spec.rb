require 'order'

describe Order do 

	let(:menu) {double :menu, dishes: [curry,kebab]}
	let(:curry) {double :dish, name: "curry", price: 500}
	let(:kebab){double :dish, name: "kebab", price: 450}

	it 'should be able to store a list of dishes' do
		
	end

	
end