require 'takeaway'

describe Takeaway do
subject(:takeaway){described_class.new}

	describe '#list' do
		it 'should return a list of dishes' do
		expect(takeaway.list).to include ({"Pepperoni Pizza" => 6.00})
		end
	end

	describe '#order' do
		it 'return total of one item' do
		expect(takeaway.order("Pepperoni Pizza")).to include "1 x Pepperoni Pizza"
		end
		it 'return total of two different items' do
		takeaway.order("Pepperoni Pizza")
		expect(takeaway.order("American Hot Pizza")).to include "1 x American Hot Pizza"
		end
		it 'return total of two identical items' do
		expect(takeaway.order("Pepperoni Pizza", 2)).to include "2 x Pepperoni Pizza"
		end
	end

	describe '#order_summary' do
		it 'should return a summary' do
		takeaway.order("Pepperoni Pizza", 2)
		expect(takeaway.order_summary).to eq "Pepperoni Pizza x 2 = 12.0 "
		end
	end

	describe '#check_total' do
		it 'should return a total' do
		takeaway.order("Pepperoni Pizza", 2)
		expect(takeaway.check_total).to eq "£12.00"
		end
	end


	describe '#complete_order' do
		before do
		allow(takeaway).to receive(:send_text)
		end

		it 'return to create a SMS' do
		expect(takeaway).to receive(:send_text).with("Thank you for your order: £0.00")
   		takeaway.complete_order
		end
		
	end

end