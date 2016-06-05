require 'menu'

describe Menu do
	describe "#food list" do
		it "should respond to each" do
			expect(subject.food_list).to respond_to(:each)
		end

	describe '#drinks item' do
		it 'should respond to each' do
			expect(subject.drinks_list). to respond_to(:each)
		end
		
	end
	end
		
end 