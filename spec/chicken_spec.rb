require 'chicken'

describe Chicken do

	it 'costs £2.35' do
		chicken = Chicken.new
		expect(chicken.price).to eq(6.25)
	end

end