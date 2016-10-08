require 'order'

describe Order do

	let(:chow_mein) { double(:dish, number: 52, name: "Chicken Chow Mein", price: 4) }
	let(:pasta) {double(:dish, name: "Pasta", number: 30, price: 3)}

	let(:menu) { double(:menu, dishes: {chow_mein.number => chow_mein, pasta.number => pasta})}

	subject(:order) {described_class.new(menu)}

	def select_dishes
		order.select(chow_mein.number)
		order.select(pasta.number)
		order.select(pasta.number)
	end

	it 'can select a number of dishes' do
		select_dishes
		expect(order.food).to include(chow_mein => 1, pasta => 2)
	end

	it 'raises an error if unknown dish number is given' do
		expect{order.select(0)}.to raise_error "We do not have a dish with that number!"
	end

	it 'gives a total' do
		select_dishes
		order.calculate_total
		expect(order.total).to eq(chow_mein.price + 2*pasta.price)
	end

end