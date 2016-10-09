require 'dish'

describe Dish do

	subject { described_class.new("Pizza",9.99) }
	
	describe '#initialize' do

		it 'has a name' do
			expect(subject.name).to be_a(String)
		end

		it 'has a price' do
			expect(subject.price).to be_a(Float)
		end

	end

end