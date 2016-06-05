require 'order'

describe Order do

subject(:order) {described_class.new}

  describe '#add' do

    context 'item is available' do
      it 'add the order' do
        expect{order.add("Burger", 2)}.to change {subject.current_order}.by [["Burger", 2]]
      end
    end

    context 'item is unavailable' do
      it 'cannot add order' do
       message = "Pasta is not on the menu!"
       expect{order.add("Pasta", 2)}.to raise_error message
      end
    end

  end
end






	# subject(:order) {described_class.new(menu)}
	# let(:menu) {double :menu, has_item?: ()}
	# let(:item) {double :item}




	
	# describe '#add' do
	# 	it 'adds an item from the menu to the order' do
	# 		order.add(item, 2)
	# 		expect(order.view).to eq ["#{item} x 2"]
	# 	end
	# 	it 'checks whether the item is on the menu' do
	# 		expect(menu).to receive(:has_item?)
	# 		order.add(item, 2)
	# 	end
	# end

	# describe '#view' do
	# 	it 'raises an error when order is empty' do
	# 		message = "Your order is empty!"
	# 		expect{order.view}.to raise_error message
	# 	end
	# end

# end