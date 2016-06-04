require 'order'

describe Order do

	subject(:order) {described_class.new(menu)}
	let(:menu) {double :menu}
	let(:item) {double :item}
	
	describe '#add' do
		it 'adds an item to the order' do
			order.add(item, 4)
			expect(order.view).to eq ["#{item} x 4"]
		end
	end


end