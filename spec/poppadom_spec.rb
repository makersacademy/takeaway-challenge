require 'poppadom'

describe Poppadom do

	it 'costs £0.75' do
		poppadom = Poppadom.new
		expect(poppadom.price).to eq(0.75)
	end

end