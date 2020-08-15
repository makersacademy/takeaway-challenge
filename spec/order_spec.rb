require 'order'

describe Order do

	it 'successfully creates instance of class' do
		expect(subject).to be_instance_of(Order)
	end

	it 'responds to method for adding dishes to order' do
		expect(subject).to respond_to(:add).with(2).arguments
	end

	describe 'add' do
		it 'adds dishes to the current order array' do
			subject.add("chicken", 2)
			expect(subject.current_order).to eq [{:chicken=>2}]
		end
	end



end
