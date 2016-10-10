require 'order'

describe Order do

	let(:chow_mein) { double(:dish, number: 52, name: "Chicken Chow Mein", price: 4) }
	let(:pasta) {double(:dish, name: "Pasta", number: 30, price: 3)}
	let(:takeaway) {double(:takeaway)}

	let(:menu) { double(:menu, dishes: {chow_mein.number => chow_mein, 
																			pasta.number => pasta})}

	before(:each) do
									allow(takeaway).to receive(:menu).and_return(menu)
									allow(takeaway).to receive(:place)
									order.select(chow_mein.number)
									order.select(pasta.number)
									order.select(pasta.number)
									order.select(chow_mein.number)
									order.select(pasta.number)
									order.place(+447000000000)
								end

	subject(:order) {described_class.new(takeaway)}

	it 'can select a number of dishes' do
		expect(order.food).to include(chow_mein => 2, pasta => 3)
	end

	it 'raises an error if unknown dish number is given' do
		expect{order.select(0)}.to raise_error "We do not have a dish with that number!"
	end

	it 'does not raise an error if known dish number is given' do
		expect{order.select(52)}.to_not raise_error
	end

	it 'can check an order' do
		expect{ order.check }.to output("Here's your order so far:\n" +
																		"2 - #{chow_mein.name}\n" +
																		"3 - #{pasta.name}\n" +
									"Order Total: £#{2*chow_mein.price + 3*pasta.price}\n").to_stdout
	end

	it 'can check an order and then place the order without doubling the total' do
		order.check
		order.place(+447000000000)
		expect(order.total).to eq(2*chow_mein.price + 3*pasta.price)
	end
	describe '#place' do

		it 'gives a total' do
			expect(order.total).to eq(2*chow_mein.price + 3*pasta.price)
		end

		it 'sends the order to the takeaway' do
			expect(order.place(+447000000000)).to eq(takeaway.place(order))
		end

		it 'provides a phone number when placing an order' do
			expect(order.phone_number).to eq(+447000000000)
		end

	end

end