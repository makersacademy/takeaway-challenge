require 'takeaway'

describe Takeaway do 

	let(:menu) {double(:menu)}
	subject(:takeaway) {described_class.new(menu)}

	describe '#menu' do

		it 'shows menu of dishes with prices' do
			expect(takeaway.menu).to eq(menu)
		end
	end
end

# 	describe '#select' do

# 		it 'selects some number of available dishes' do

# 		end

# 	end

# 	describe '#total' do

# 		it 'checks the total for dishes in my order' do

# 		end

# 	end

# 	describe '#text' do

# 		it 'receives a text to say "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered' do

# 		end

# end