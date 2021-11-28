require 'restaurant'

describe Restaurant do
	subject(:restaurant) {Restaurant.new}

	context "initialization" do
		it 'creates an instance of itself' do
			expect(restaurant).to be_an_instance_of(Restaurant)
		end

		it 'creates a pizza menu on initialization' do
			expect(restaurant.pizza_menu).not_to be_empty
		end
	end

	context "empty orders array" do
		it "creates an orders empty array on initialization" do
			expect(restaurant.orders).to be_empty
		end
	end

end