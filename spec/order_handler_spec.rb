require 'order_handler'

describe "OrderHandler" do

	let( :order_handler ) { OrderHandler.new }
	let( :customer      ) { double customer}
	
	describe "#show_menu" do
		expect( customer ).to receive :menu
	end

end