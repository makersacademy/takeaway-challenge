require 'restaurant'
describe Restaurant do
	 subject(:restaurant) { described_class.new(menu: menu, order: order) }
	 
	 let(:menu) { double(:menu, print: printed_menu) }
	 let(:order) { instance_double("Order", total: 15.50) }
	 let(:printed_menu) { "Spring roll: £0.99" }

	 let(:dishes) { { chicken: 2, fish: 1 } }

	 it 'creates an instance of a Restaurant' do
 	  expect(subject).to be_a Restaurant
 	end

 	it 'should be able to print menu items' do
	 	 expect(restaurant.print_menu).to eq(printed_menu)
	 end

	 it 'can order some number of several available dishes' do
 		 expect(order).to receive(:add).twice
 		 restaurant.place_order(dishes)
 	end
 	it 'knows the order total' do
 		allow(order).to receive(:add)
 		total = restaurant.place_order(dishes)
 		expect(total).to eq(15.50)
 	end
end
