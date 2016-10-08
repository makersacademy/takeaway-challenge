require 'order'

describe Order do

	let(:chow_mein) { double(:dish, number: 52, name: "Chicken Chow Mein", price: 3) }
	let(:pasta) {double(:dish, name: "Pasta", number: 30, price: 3)}

	let(:menu) { double(:menu, dishes: {chow_mein.number => chow_mein, pasta.number => pasta})}

	subject(:order) {described_class.new(menu)}

	it 'can select a number of dishes' do
		order.select(chow_mein.number)
		order.select(pasta.number)
		expect(order.food).to include(chow_mein, pasta)
	end

end