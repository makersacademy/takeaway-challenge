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

	it 'responds to price calculator method' do
		expect(subject).to respond_to(:price_calc)
	end

	describe 'price_calc' do

		it 'stores prices of all ordered dishes in receipt' do
			subject.current_order = [{:chicken=>2}]
			expect { subject.price_calc }.to change { subject.receipt }.from([]).to([9.0])
		end

	end

  it 'responds to basket method' do
		expect(subject).to respond_to(:basket)
	end



end
