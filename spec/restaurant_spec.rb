require 'restaurant'

describe Restaurant do
	subject(:restaurant) {Restaurant.new}
	let(:item) {"bianco"}
	let(:another_item) {"fumo"}
	let(:total) {4.99 + 5.80}

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

	context "#confirm_order" do
		it 'has a #confirm_order' do
			expect(restaurant).to respond_to(:confirm_order)
		end

		it 'sends a confirmation msg' do
			mock_restaurant = double('restaurant') 
			mock_msg = "Ordered Successfully placed @#{Time.new.strftime("%H:%M")}! You will shortly receive an sms confirmation."
			allow(mock_restaurant).to receive(:confirm_order).and_return(mock_msg)
			expect(mock_restaurant.confirm_order).to eq mock_msg
		end

	end

	context "#show_total functionality" do
		it "has a #show_total method" do
			expect(restaurant).to respond_to(:show_total)
		end

		it 'returns a total amount of items ordered' do
			restaurant.add_to_cart(item) # 4.99
			restaurant.add_to_cart(another_item) # 5.80
			expect(restaurant.show_total).to eq 10.79
		end
	end

	context "#check_total functionality" do
		it "has a #check_total method" do
			expect(restaurant).to respond_to(:check_total).with(1).argument
		end

		it "returns a true based on the value of total provided based on user's orders" do
			restaurant.add_to_cart(item) # 4.99
			restaurant.add_to_cart(another_item) # 5.80
			expect(restaurant.check_total(total)).to eq true
		end

		it "returns a true based on the value of total provided based on user's orders" do
			restaurant.add_to_cart(item) # 4.99
			restaurant.add_to_cart(another_item) # 5.80
			expect(restaurant.check_total(13)).to eq false
		end
	end

	context "generating delivery deadline" do
		it 'has #generate_delivery_deadline method' do
			expect(restaurant).to respond_to(:generate_delivery_deadline)
		end

		it 'returns a specific time (1 hour from the order confirmation)' do
			expect(restaurant.generate_delivery_deadline).to eq (Time.now + 1*60*60).strftime("%H:%M")
		end
	end

end
