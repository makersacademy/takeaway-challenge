require "dish"

describe Dish do
	let(:dish) { Dish.new("PadThai", 7.95)}
		it "has a name" do 
			expect(dish.name).to eq "PadThai"	
		end 
		it "has a price" do 
			expect(dish.price).to eq 7.95
		end 
end
