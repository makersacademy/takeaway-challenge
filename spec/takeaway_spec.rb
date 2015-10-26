require 'takeaway'

describe Takeaway do
	
	menu = {fish_and_chips: 5.99, curry_and_rice: 7.99, wun_ton_soup: 5.99, sweet_and_sour_pork: 6.50, prawns_chop_suey: 5.50}
	dish = :fish_and_chips 
	let(:qty) {2}
	let(:user_total) {15}
	let(:order) {{fish_and_chips: [5.99,2]}}
	let(:confirmation) {double :confirmation}
	let(:text) {double :text}
	subject(:takeaway) {described_class.new(menu)}
	

	context '#initialize' do
		it 'assigns the input menu to a variable' do
			expect(takeaway.menu).to eq menu
		end
		it 'creates an empty hash to store the order' do
			expect(takeaway.checkout).to be_empty
		end
	end

	context '#show' do
		it 'returns the meals on the menu' do
			expect(takeaway.show).to eq menu
		end
	end

	context '#place_order' do
		it 'allows a user to input their dish and stores the order' do
			takeaway.place_order(dish,qty)
			expect(takeaway.checkout).to include(order)
		end
	end

	context '#confirm'  do
		it 'sends a message to confirmation' do
			expect(confirmation).to receive(:user_cost)
			takeaway.confirm(user_total,confirmation)
		end
	end

	context '#proceed'  do
		it 'sends a message to text' do
			expect(text).to receive(:message)
			takeaway.proceed(text)
		end
	end
end