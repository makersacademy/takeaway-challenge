require 'customer'

describe Customer do

	let( :customer      ) { Customer.new order_handler }
	let( :order_handler ) { double :order_handler, :show_menu => :menu }
	
	describe "#get_menu" do

		it "requests the menu" do
			expect( order_handler ).to receive :show_menu
			customer.get_menu
		end

	end

end