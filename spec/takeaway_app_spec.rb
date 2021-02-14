require 'takeaway_app'

describe TakeawayApp do
	let(:dish) {double :dish, name: "name", price: "price"}
	let(:order) { double :order, cart: [] }
	
	describe '#check' do
		# returns list of dishes and prices
		it 'should return a list of dishes' do
			expect(subject.check).to be_a Array
		end

		context 'when a dish has been added' do
			before do
				subject.add_dish(dish)
			end

			it 'should return the name of the dish and its price' do
				expect{ subject.check }.to output("name, £price\n").to_stdout
			end
		end
	end

	describe '#add_dish' do
		it 'should add dishes to the list of available dishes' do
			expect{ subject.add_dish(dish) }.to change{ subject.available_dishes.count }.by(1)
		end
	end

	describe '#select' do
		it { is_expected.to respond_to(:select).with(1).argument }

		it 'should add selected dishes to a cart' do
			expect{ subject.select(dish) }.to change{ subject.order.cart.count }.by(1)
		end
	end

end