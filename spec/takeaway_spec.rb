require 'takeaway'

describe Takeaway do
	 subject(:takeaway) { described_class.new(menu: menu, order: order) }

	 let(:menu) { double(:menu, print: printed_menu) }
	 let(:order) { instance_double("Order", total: 3.30) }
	 let(:printed_menu) { "Tucker: £3.30" } 

	 let(:dishes) { { tucker: 1} }
	
	 it "calls print on menu expecting it to equal printed_menu" do
 		 expect(takeaway.print_menu).to eq(printed_menu)
 	end
	
	 it "calls place_order on itself (adding dishes to its sum) 'quantity' number of times" do
 		 expect(order).to receive(:add)
 		 takeaway.place_order(dishes)
 	end

	 it "totals (every place_order called on itself) expecting it to equal the sum value of all dishes args passed" do
		allow(order).to receive(:add)
 		total = takeaway.place_order(dishes)
 		expect(total).to eq(3.30)
 	end
end


# expect(order).to receive(:add).twice.30
