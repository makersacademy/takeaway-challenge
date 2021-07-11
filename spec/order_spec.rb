require 'order'
require 'menu'

describe Order do
	 subject(:order) { described_class.new(menu) }

	 let(:menu) { double(:menu) }

	 let(:dishes) do
 		 { 
  		 tucker: 1
  		}
 	end

	 before do 
 		 allow(menu).to receive(:has_dish?).with(:tucker).and_return(true)
 		 allow(menu).to receive(:price).with(:tucker).and_return(3.30)
 	end

	 it "add passes dish and quantity as args to order, equalling a hash of selected dish/quantities" do 
 		 order.add(:tucker, 1)
 		 expect(order.dishes).to eq(dishes)
 	end
 
	 it "add is passed a dish not on menu invoking a fail expecting add to break from adding said dish to order" do
 		 allow(menu).to receive(:has_dish?).with(:shark).and_return(false)
 		 expect { subject.add(:shark, 1) }.to raise_error NoItemError, "Sorry, we removed Shark from the menu due to unpopular demand!"
 	end

	 it "calls add on itself wherein items_totals sums values expecting it to equal the sum value of the order" do 
 		 order.add(:tucker, 1)
 		 total = 3.30
 		 expect(order.total).to eq(total)
 	end
end
