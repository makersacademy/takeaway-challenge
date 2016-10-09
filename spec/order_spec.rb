require 'order'

describe Order do
	
	describe '#initialize' do

		it 'sets current order to an empty array' do
			expect(subject.current_order).to eq []
		end

	end

	describe '#update_order' do

		it 'adds an item to the current order' do
			initial_count = subject.current_order.count
			subject.update_order(:item)
			expect(subject.current_order.count).to be > initial_count
		end
	end

end