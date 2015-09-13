require 'naan'

describe Naan do

	it 'costs £1.29' do
		naan = Naan.new
		expect(naan.price).to eq(1.29)
	end

end