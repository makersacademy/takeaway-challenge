require 'dish'
	
	describe Dish do
		
		it 'should have a name' do
			test_dish = Dish.new("test", 1.99)
			expect(test_dish).to have_attributes(:name => String)
		end

		it 'should have a price' do
			test_dish = Dish.new("test", 1.99)
			expect(test_dish).to have_attributes(:price => (a_value > 0) )
		end
	end