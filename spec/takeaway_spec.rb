require 'takeaway'

describe Takeaway do

	subject(:takeaway) {described_class.new(menu, order, sms_class)}
	let(:menu) {double :menu}
	let(:order) {double :order, add: (), total: (10)}
	let(:item) {double :item}
	let(:quantity) {double :quantity}
	let(:sms_class) {double :sms_class, new: sms}
	let(:sms) {double :sms, send: ()}
	
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
			expect(order).to receive(:total).twice
			takeaway.checkout
		end
	end

	describe 'confirm_order' do
		it 'raises error if wrong amount entered' do
			takeaway.add_to_order(item, quantity)
			message = 'Incorrect amount! Please try again.'
			expect{takeaway.confirm_order('£5')}.to raise_error message
		end
		it 'sends an sms if correct amount entered' do
			takeaway.add_to_order(item, quantity)
			expect(sms_class).to receive(:new)
			takeaway.confirm_order('£10')
		end
	end
	
end