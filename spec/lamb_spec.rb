require 'lamb'

describe Lamb do

	it 'costs £7.49' do
		lamb = Lamb.new
		expect(lamb.price).to eq(7.49)
	end

end