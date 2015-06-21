require 'order_processor'

describe OrderProcessor do 

	subject { OrderProcessor.new notifiable, calculable }
	let( :notifiable ) { double 'notifiable', :call => nil }
	let( :calculable ) { double 'calculable' }


	# describe "#process" do

	# 	it "deals with the order" do

	# 	end

	# 	context "when the order is accepted" do
	# 		it "pass call to notifiable" do
	# 			expect( notifiable ).to receive :call
				
	# 		end	
	# 	end

	# 	context "when the order is no accepted" do
	# 		it "raises an error" do
				
	# 		end
	# 	end
	# end
	
end