require 'mutton'

describe Mutton do

	it 'costs £6.59' do
		mutton = Mutton.new
		expect(mutton.price).to eq(6.59)
	end

end