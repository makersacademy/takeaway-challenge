require 'restaurant'

describe Restaurant do
	subject(:restaurant) {Restaurant.new}
	let(:item) {"bianco"}
	let(:another_item) {"fumo"}

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

	context "#add_to_cart" do
		it "has #add_to_cart method" do
			expect(restaurant).to respond_to(:add_to_cart).with(1).argument
		end

		it "selects an item from the pizza_menu and adds to selection array" do
			restaurant.add_to_cart(item)
			expect(restaurant.orders).not_to be_empty
		end

		it "returns a total of the items selected" do
			restaurant.add_to_cart(item)
			message = "#{another_item} successfully submitted!"
			expect(restaurant.add_to_cart(another_item)).to eq message
		end
	end 

end