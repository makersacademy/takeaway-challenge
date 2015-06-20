require 'customer'

describe Customer do

	let( :customer      ) { Customer.new :order_handler }
	let( :order_handler ) { double :order_handler, :show_menu => :menu }
	
	describe "#get_menu" do

		it "returns the menu" do
			expect( order_handler.show_menu ).to eq :menu
		end

	end

end