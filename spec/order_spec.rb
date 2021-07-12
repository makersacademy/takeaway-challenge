require 'order'
require 'menu'

describe Order do
	 subject(:order) { described_class.new(menu) }

	 let(:menu) { double(:menu) }

	 let(:dishes) do
 		 { 
  		 tuckeroo: 2
  		}
 	end

	 before do 
 		 allow(menu).to receive(:dish?).with(:tuckeroo).and_return(true)
 		 allow(menu).to receive(:price).with(:tuckeroo).and_return(5.50)
 	end

	 it "add passes dish and quantity as args to order, equalling a hash of selected dish/quantities" do 
 		 order.add(:tuckeroo, 2)
 		 expect(order.dishes).to eq(dishes)
 	end
 
	 it "add is passed a dish not on menu invoking a fail expecting add to break from adding said dish to order" do
 		 allow(menu).to receive(:dish?).with(:shark).and_return(false)
 		 expect { subject.add(:shark, 1) }.to raise_error NoItemError, "We're out of Shark"
 	end

	 it "calls add on itself wherein items_totals sums values expecting it to equal the sum value of the order" do 
 		 order.add(:tuckeroo, 2)
 		 total = 11.00
 		 expect(order.total).to eq(total)
 	end
end
