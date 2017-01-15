require 'takeaway'

describe Takeaway do

	subject (:takeaway)	{ described_class.new(menu) }
	let (:menu)			{ double(:menu, print_menu: "printed", items: {"pizza" => 7.99}) }
	let (:send_sms)		{ double(:send_sms) }


	it 'has a menu' do
		expect(takeaway.view_menu).to eq menu.print_menu
	end

	describe '#add_to_order' do

		it 'should raise an error if food is not on menu' do
			expect{takeaway.add_to_order("sandwich")}.to raise_error "Cannot add to order: that item is not on the menu."
		end

		it 'should add one of the item to the order by default' do
			expect {takeaway.add_to_order("pizza")}.to change {takeaway.order.current_order.count}.by(1)
		end

		it 'can add multiple items at once' do
			expect {takeaway.add_to_order("pizza", 3)}.to change {takeaway.order.current_order.count}.by(3)
		end

		it 'adds the price of each item to the order total' do
			expect {takeaway.add_to_order("pizza")}.to change {takeaway.order.total}.by(7.99)
		end

		it 'returns the current order total' do
			takeaway.add_to_order("pizza")
			expect(takeaway.add_to_order("pizza")).to eq "Your current order total is £15.98"
		end

	end

	describe '#check_order' do

		it 'should return a list of ordered items as a string' do
			expect(takeaway.check_order).to be_a(String)
		end

		it 'should inclue items ordered' do
			takeaway.add_to_order("pizza")
			expect(takeaway.check_order).to include("pizza")
		end
 
	end

	describe '#place_order' do
		before (:each) do
			allow(takeaway).to receive(:send_sms).and_return(true)
		end

		it 'creates an SMS' do
		    expect(takeaway.send_sms).to eq true
		end
		

	end
	
end