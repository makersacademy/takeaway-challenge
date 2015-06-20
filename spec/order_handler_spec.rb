require 'order_handler'

describe "OrderHandler" do

	let( :order_handler ) { OrderHandler.new menu }
	let( :menu ) { :menu }
	
	describe "#show_menu" do

		it "returns the menu" do
			expect( order_handler.show_menu ).to eq :menu
		end

	end

end