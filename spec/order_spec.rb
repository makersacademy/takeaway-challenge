require 'order'

describe Order do

	it 'successfully creates instance of class' do
		expect(subject).to be_instance_of(Order)
	end

	it 'responds to method for adding dishes to order' do
		expect(subject).to respond_to(:add)
	end



end
