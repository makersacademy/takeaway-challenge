require 'order'

describe Order do

	let(:chow_mein) { double(:dish, number: 52, name: "Chicken Chow Mein", price: 4) }
	let(:pasta) {double(:dish, name: "Pasta", number: 30, price: 3)}

	let(:menu) { double(:menu, dishes: {chow_mein.number => chow_mein, 
																			pasta.number => pasta})}

	subject(:order) {described_class.new(menu)}

	def select_dishes
		order.select(chow_mein.number)
		order.select(pasta.number)
		order.select(pasta.number)
		order.select(chow_mein.number)
		order.select(pasta.number)
		order.calculate_total
	end

	it 'can select a number of dishes' do
		select_dishes
		expect(order.food).to include(chow_mein => 2, pasta => 3)
	end

	it 'raises an error if unknown dish number is given' do
		expect{order.select(0)}.to raise_error "We do not have a dish with that number!"
	end

	it 'gives a total' do
		select_dishes
		expect(order.total).to eq(2*chow_mein.price + 3*pasta.price)
	end

	it 'can place an order' do
		select_dishes
		expect{ order.place }.to output("Order Placed:\n" +
																		"2 - #{chow_mein.name}\n" +
																		"3 - #{pasta.name}\n" +
									"Order Total: £#{2*chow_mein.price + 3*pasta.price}\n").to_stdout
	end

end