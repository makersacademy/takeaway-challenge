require 'takeaway'

describe Takeaway do

	subject(:takeaway) {described_class.new(menu, order)}
	let(:menu) {double :menu}
	let(:order) {double :order, add: ()}
	let(:item) {double :item}
	let(:quantity) {double :quantity}
	
	describe '#view_menu' do
		it 'allows customer to view menu' do
			expect(menu).to receive(:view)
			takeaway.view_menu
		end
	end

	describe '#add_to_order' do
		it 'adds item to order' do
			expect(order).to receive(:add).with(item, quantity)
			takeaway.add_to_order(item, quantity)
		end
	end

	describe '#view_order' do
		it 'allows customer to view order' do
			takeaway.add_to_order(item, quantity)
			expect(order).to receive(:view)
			takeaway.view_order
		end
	end

	describe '#checkout' do
		it 'allows customer to check total' do
			takeaway.add_to_order(item, quantity)
			expect(order).to receive(:total)
			takeaway.checkout
	end
	end

end