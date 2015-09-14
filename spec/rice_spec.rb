require 'rice'

describe Rice do

	it 'costs £2.35' do
		rice = Rice.new
		expect(rice.price).to eq(2.35)
	end

end