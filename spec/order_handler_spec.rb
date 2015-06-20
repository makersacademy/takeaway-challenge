require 'order_handler'

describe "OrderHandler" do

	let( :order_handler ) { OrderHandler.new menu, order_processor }
	let( :order_processor ) { double :order_processor, :process => nil }
	let( :menu ) { double 'menu' }
	
	describe "#show_menu" do
		it "returns the menu" do
			expect( order_handler.show_menu ).to eq menu
		end
	end

	# describe "#process_order" do
	# 	let( :order ) { double 'order' }

	# 	it "sends the order to OrderProcessor" do
	# 		expect( order_processor ).to receive( :process ).with( order )
	# 		order_handler.process_order order
	# 	end
	# end

end