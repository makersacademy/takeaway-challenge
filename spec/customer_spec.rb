require 'customer'

describe Customer do

	let( :customer      ) { Customer.new order_handler }
	let( :order_handler ) do 
	  double :order_handler, :show_menu 		=> :menu, 
	  											 :process_order => nil
	end
	
	# describe "#get_menu" do
	# 	it "requests the menu" do
	# 		expect( order_handler ).to receive :show_menu
	# 		customer.get_menu
	# 	end
	# end

	describe "#send_order" do
		it "sends an order" do
			expect( order_handler ).to receive :process_order
			customer.send_order "an_order"
		end
	end

end