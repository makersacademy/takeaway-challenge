require 'order'

describe Order do

	subject(:order) {described_class.new(menu)}
	let(:menu) {double :menu, has_item?: ()}
	let(:item) {double :item}
	
	describe '#add' do
		it 'adds an item from the menu to the order' do
			order.add(item, 4)
			expect(order.view).to eq ["#{item} x 4"]
		end
		it 'checks whether the item is on the menu' do
			expect(menu).to receive(:has_item?)
			order.add(item, 4)
		end
	end

	describe '#view' do
		it 'raises an error when order is empty' do
			message = "Your order is empty!"
			expect{order.view}.to raise_error message
		end
	end

end