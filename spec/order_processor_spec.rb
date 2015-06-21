require 'order_processor'

describe OrderProcessor do 

	subject { OrderProcessor.new notifier, calculable }
	let( :notifier ) { double 'notifier', :call => nil }
	let( :calculable ) { double 'calculable' }


	# describe "#process" do

	# 	it "deals with the order" do

	# 	end

	# 	context "when the order is accepted" do
	# 		it "pass call to notifier" do
	# 			expect( notifier ).to receive :call
				
	# 		end	
	# 	end

	# 	context "when the order is no accepted" do
	# 		it "raises an error" do
				
	# 		end
	# 	end
	# end
	
end




require 'order_handler'

# describe "OrderHandler" do

# 	let( :order_handler ) { OrderHandler.new eatable, order_processor }
# 	let( :order_processor ) { double :order_processor, :process => nil }
# 	let( :eatable ) { double 'eatable', :show => :eatable }
	
# 	describe "#show_eatable" do
# 		it "returns the eatable" do
# 			expect( order_handler.show_eatable ).to eq :eatable
# 		end
# 	end

# 	describe "#process_order" do
# 		let( :order ) { double 'order' }

# 		it "sends the order to OrderProcessor" do
# 			expect( order_processor ).to receive( :process ).with( order )
# 			order_handler.call order
# 		end
# 	end

# end